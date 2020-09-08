# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/transactions', type: :request do
  describe 'GET /index' do
    subject { get transactions_url }

    context 'sem transactions' do
      it 'retorna sucesso' do
        subject
        expect(response).to be_successful
      end

      it 'retorna um array vazio' do
        subject
        expect(JSON.parse(response.body)).to be_empty
      end
    end

    context 'com transaction' do
      let!(:transactions) { create_list(:transaction, 3) }

      it 'retorna sucesso' do
        subject
        expect(response).to be_successful
      end

      it 'retorna um array com os transactions' do
        subject
        expect(JSON.parse(response.body).count).to eq transactions.count
      end
    end
  end

  describe 'GET /show' do
    subject { get transaction_url(id) }
    context 'com um id inexistente' do
      let!(:id) { 1 }

      it 'retorna não encontrado' do
        subject
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'com um id existente' do
      let!(:transaction) { create(:transaction) }
      let!(:id) { transaction.id }

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
    subject { post transactions_url, params: { transaction: attributes } }

    context 'com atributos válidos' do
      let!(:attributes) { build(:transaction).attributes }

      it 'retorna criado' do
        subject
        expect(response).to have_http_status(:created)
      end

      it 'cria uma nova transação' do
        expect { subject }.to change(Transaction, :count).by(1)
      end
    end

    context 'com atributos inválidos' do
      let!(:attributes) { build(:transaction, store: nil).attributes }

      it 'retorna erro' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'não cria uma nova transação' do
        expect { subject }.to_not change(Transaction, :count)
      end
    end
  end

  describe 'PATCH /update' do
    subject { patch transaction_url(id), params: { transaction: attributes } }
    let!(:attributes) { nil }

    context 'com um id inexistente' do
      let!(:id) { 1 }

      it 'retorna não encontrado' do
        subject
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'com um id existente' do
      let!(:transaction) { create(:transaction) }
      let!(:id) { transaction.id }

      context 'com atributos válidos' do
        let!(:attributes) { build(:transaction).attributes }

        it 'retorna sucesso' do
          subject
          expect(response).to be_successful
        end

        it 'altera o objeto existente' do
          expect { subject }.to change { transaction.reload.value }.to attributes['value']
        end
      end

      context 'com atributos inválidos' do
        let!(:attributes) { build(:transaction, store: nil).attributes }

        it 'retorna erro' do
          subject
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'não altera o objeto existente' do
          expect { subject }.to_not change { transaction.reload.attributes }
        end
      end
    end
  end

  describe 'DELETE /destroy' do
    subject { delete transaction_url(id) }
    context 'com um id inexistente' do
      let!(:id) { 1 }

      it 'retorna não encontrado' do
        subject
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'com um id existente' do
      let!(:transaction) { create(:transaction) }
      let!(:id) { transaction.id }

      it 'retorna sucesso' do
        subject
        expect(response).to be_successful
      end

      it 'remove o registro' do
        expect { subject }.to change(Transaction, :count).by(-1)
      end
    end
  end
end
