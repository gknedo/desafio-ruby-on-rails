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
end
