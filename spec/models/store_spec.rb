# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'criando uma loja' do
    context 'com paramêtros válidos' do
      it 'seja válido' do
        expect(build(:store)).to be_valid
      end
    end

    context 'sem nome' do
      it 'seja inválido' do
        expect(build(:store, name: nil)).to_not be_valid
      end
    end

    context 'sem nome do dono' do
      it 'seja inválido' do
        expect(build(:store, owner_name: nil)).to_not be_valid
      end
    end
  end

  describe 'o saldo de uma loja' do
    subject { store.balance }
    let!(:store) { create(:store) }

    context 'sem transações' do
      it 'é 0' do
        expect(subject).to eq 0
      end
    end

    context 'com uma transação de crédito' do
      let!(:credit) { create(:transaction, store: store, income: true) }

      it 'é o valor da transação de crédito' do
        expect(subject).to eq credit.value
      end

      context 'e uma transação de débito' do
        let!(:debit) { create(:transaction, store: store, income: false) }

        it 'é o valor da transação de crébito menos a transação de débito' do
          expect(subject).to eq(credit.value - debit.value)
        end
      end
    end

    context 'com uma transação de débito' do
      let!(:debit) { create(:transaction, store: store, income: false) }

      it 'é o inverso do valor da transação de débito' do
        expect(subject).to eq(-debit.value)
      end
    end
  end
end
