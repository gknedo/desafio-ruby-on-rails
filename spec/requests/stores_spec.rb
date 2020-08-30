# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/stores', type: :request do
  describe 'GET /index' do
    subject { get stores_url }

    context 'sem lojas' do
      it 'retorna sucesso' do
        subject
        expect(response).to be_successful
      end

      it 'retorna um array vazio' do
        subject
        expect(JSON.parse(response.body)).to be_empty
      end
    end

    context 'com lojas' do
      let!(:stores) { create_list(:store, 3) }

      it 'retorna sucesso' do
        subject
        expect(response).to be_successful
      end

      it 'retorna um array com as lojas' do
        subject
        expect(JSON.parse(response.body).count).to eq stores.count
      end
    end
  end

  describe 'GET /show' do
    subject { get store_url(id) }
    context 'com um id inexistente' do
      let!(:id) { 1 }

      it 'retorna não encontrado' do
        subject
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'com um id existente' do
      let!(:id) { create(:store).id }

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
    subject { post stores_url, params: { store: attributes } }

    context 'com atributos válidos' do
      let!(:attributes) { build(:store).attributes }

      it 'retorna criado' do
        subject
        expect(response).to have_http_status(:created)
      end

      it 'cria um novo tipo de transação' do
        expect { subject }.to change(Store, :count).by(1)
      end
    end

    context 'com atributos inválidos' do
      let!(:attributes) { build(:store, name: nil).attributes }

      it 'retorna erro' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'não cria um novo tipo de transação' do
        expect { subject }.to_not change(Store, :count)
      end
    end
  end

  describe 'PATCH /update' do
    subject { patch store_url(id), params: { store: attributes } }
    let!(:attributes) { nil }

    context 'com um id inexistente' do
      let!(:id) { 1 }

      it 'retorna não encontrado' do
        subject
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'com um id existente' do
      let!(:store) { create(:store) }
      let!(:id) { store.id }

      context 'com atributos válidos' do
        let!(:attributes) { build(:store).attributes }

        it 'retorna sucesso' do
          subject
          expect(response).to be_successful
        end

        it 'altera o objeto existente' do
          expect { subject }.to change { store.reload.name }.to attributes['name']
        end
      end

      context 'com atributos inválidos' do
        let!(:attributes) { build(:store, name: nil).attributes }

        it 'retorna erro' do
          subject
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'não altera o objeto existente' do
          expect { subject }.to_not change { store.reload.attributes }
        end
      end
    end
  end

  describe 'DELETE /destroy' do
    subject { delete store_url(id) }
    context 'com um id inexistente' do
      let!(:id) { 1 }

      it 'retorna não encontrado' do
        subject
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'com um id existente' do
      let!(:store) { create(:store) }
      let!(:id) { store.id }

      it 'retorna sucesso' do
        subject
        expect(response).to be_successful
      end

      it 'remove o registro' do
        expect { subject }.to change(Store, :count).by(-1)
      end
    end
  end
end
