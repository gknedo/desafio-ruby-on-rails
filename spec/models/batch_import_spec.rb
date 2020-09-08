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
end
