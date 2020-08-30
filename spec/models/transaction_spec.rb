# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'com paramêtros válidos' do
    it 'seja válida' do
      expect(build(:transaction)).to be_valid
    end
  end

  context 'sem uma loja associada' do
    it 'seja inválida' do
      expect(build(:transaction, store: nil)).to_not be_valid
    end
  end

  context 'sem um tipo de transação' do
    it 'seja inválida' do
      expect(build(:transaction, transaction_type: nil)).to_not be_valid
    end
  end

  context 'sem uma data da transação' do
    it 'seja inválida' do
      expect(build(:transaction, transacted_at: nil)).to_not be_valid
    end
  end

  context 'com um valor' do
    let!(:transaction) { build(:transaction, value: value) }

    context 'nulo' do
      let!(:value) { nil }

      it 'seja inválida' do
        expect(transaction).to_not be_valid
      end
    end

    context 'negativo' do
      let!(:value) { -1 }

      it 'seja inválida' do
        expect(transaction).to_not be_valid
      end
    end

    context 'zero' do
      let!(:value) { 0 }

      it 'seja inválida' do
        expect(transaction).to_not be_valid
      end
    end

    context 'decimal' do
      let!(:value) { 1.5 }

      it 'seja inválida' do
        expect(transaction).to_not be_valid
      end
    end

    context 'positivo' do
      let!(:value) { 1 }

      it 'seja válida' do
        expect(transaction).to be_valid
      end
    end
  end

  context 'sem um valor' do

  end

  context 'sem um cpf' do
    it 'seja inválida' do
      expect(build(:transaction, cpf: nil)).to_not be_valid
    end
  end

  context 'sem um numero de cartao' do
    it 'seja inválida' do
      expect(build(:transaction, card: nil)).to_not be_valid
    end
  end
end
