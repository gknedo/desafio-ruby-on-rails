# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionType, type: :model do
  describe 'criando um tipo de transaction' do
    context 'com paramêtros válidos' do
      it 'seja válido' do
        expect(build(:transaction_type)).to be_valid
      end
    end

    context 'sem código' do
      it 'seja inválido' do
        expect(build(:transaction_type, code: nil)).to_not be_valid
      end
    end

    context 'sem descrição' do
      it 'seja inválido' do
        expect(build(:transaction_type, description: nil)).to_not be_valid
      end
    end
  end

  describe 'retornando o sinal de um tipo de transação' do
    subject { build(:transaction_type, income: income).signal }

    context 'de uma transação de crédito' do
      let!(:income) { true }

      it 'retorna o valor 1' do
        expect(subject).to eq 1
      end
    end

    context 'de uma transação de dédito' do
      let!(:income) { false }

      it 'retorna o valor -1' do
        expect(subject).to eq -1
      end
    end
  end
end
