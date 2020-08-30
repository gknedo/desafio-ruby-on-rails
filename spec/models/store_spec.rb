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
end
