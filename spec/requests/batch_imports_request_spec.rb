# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'BatchImports', type: :request do
  describe 'GET /index' do
    subject { get batch_imports_url }

    context 'sem importações' do
      it 'retorna sucesso' do
        subject
        expect(response).to be_successful
      end

      it 'retorna um array vazio' do
        subject
        expect(JSON.parse(response.body)).to be_empty
      end
    end

    context 'com importações' do
      let!(:batch_imports) { create_list(:batch_import, 3) }

      it 'retorna sucesso' do
        subject
        expect(response).to be_successful
      end

      it 'retorna um array com as importações' do
        subject
        expect(JSON.parse(response.body).count).to eq batch_imports.count
      end
    end
  end

  describe 'GET /show' do
    subject { get batch_import_url(id) }
    context 'com um id inexistente' do
      let!(:id) { 1 }

      it 'retorna não encontrado' do
        subject
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'com um id existente' do
      let!(:id) { create(:batch_import).id }

      it 'retorna sucesso' do
        subject
        expect(response).to be_successful
      end

      it 'retorna o registro buscado' do
        subject
        expect(JSON.parse(response.body)['id']).to eq id
      end
    end
  end

  describe 'POST /create' do
    subject { post batch_imports_url, params: { batch_import: attributes } }

    context 'com atributos válidos' do
      let!(:attributes) { build(:batch_import).attributes }

      it 'retorna criado' do
        subject
        expect(response).to have_http_status(:created)
      end

      it 'cria uma nova importação' do
        expect { subject }.to change(BatchImport, :count).by(1)
      end
    end

    context 'com atributos inválidos' do
      let!(:attributes) { build(:batch_import, name: nil).attributes }

      xit 'retorna erro' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end

      xit 'não cria uma nova importação' do
        expect { subject }.to_not change(BatchImport, :count)
      end
    end
  end
end
