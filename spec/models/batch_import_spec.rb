# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BatchImport, type: :model do
  describe 'ao verificar o status de uma importação' do
    subject { batch_import.reload.status.to_sym }
    let!(:batch_import) { create(:batch_import, status: status) }

    context 'sem status' do
      let!(:status) { nil }

      it 'retorna em processamento' do
        expect(subject).to eq :processing
      end
    end

    context 'com status em processamento' do
      let!(:status) { 1 }

      it 'retorna em processamento' do
        expect(subject).to eq :processing
      end
    end

    context 'com status finalizado' do
      let!(:status) { 2 }

      it 'retorna em processamento' do
        expect(subject).to eq :completed
      end
    end
  end

  describe 'ao fazer a importação' do
    subject { batch_import.import!(file) }
    let!(:batch_import) { create(:batch_import) }
    let!(:file) { File.open('/opt/app/CNAB.txt') }

    before do
      allow_any_instance_of(BatchImport).to receive(:import_line!).and_return(true)
    end

    it 'deve realizar o parse de cada linha' do
      expect(batch_import).to receive(:import_line!).exactly(file.readlines.size)
      subject
    end

    it 'finaliza a importação' do
      expect{subject}.to change{batch_import.reload.status.to_sym}.from(:processing).to(:completed)
    end

  end

  describe 'ao parsear uma linha' do
    subject { batch_import.import_line!(line) }
    let!(:batch_import) { create(:batch_import) }
    let!(:line) { "3201903010000019200845152540736777****1313172712MARCOS PEREIRAMERCADO DA AVENIDA\n" }

    let!(:transaction_type) { create(:transaction_type, code: 3) }

    context 'se o tipo da transação não existir' do
      before do
        transaction_type.delete
      end

      it 'não cria uma transação' do
        expect{subject}.to_not change(Transaction, :count)
      end
    end

    context 'com todos os dados corretos' do
      it 'cria uma transação' do
        expect{subject}.to change(Transaction, :count).by 1
      end

      it 'cria uma transação com os dados corretos' do
        transaction = subject

        expect(transaction.transaction_type.code).to eq 3
        expect(transaction.transacted_at).to eq DateTime.new(2019,03,01,17,27,12)
        expect(transaction.value).to eq 19200
        expect(transaction.cpf).to eq '84515254073'
        expect(transaction.card).to eq '6777****1313'
        expect(transaction.store.name).to eq 'Mercado Da Avenida'
        expect(transaction.store.owner_name).to eq 'Marcos Pereira'
      end

      context 'se a loja não existir' do
        let!(:store) { create(:store) }
        it 'cria a loja' do
          expect{subject}.to change(Store, :count).by(1)
        end
      end

      context 'se a loja existir' do
        let!(:store) { create(:store, name: 'Mercado Da Avenida', owner_name: 'Marcos Pereira') }
        it 'utiliza a loja existente' do
          expect{subject}.to_not change(Store, :count)
        end
      end
    end
  end

end
