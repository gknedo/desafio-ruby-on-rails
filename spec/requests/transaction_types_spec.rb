require 'rails_helper'

RSpec.describe "/transaction_types", type: :request do

  describe "GET /index" do
    subject { get transaction_types_url }

    context 'sem transaction types' do
      it 'retorna sucesso' do
        subject
        expect(response).to be_successful
      end

      it 'retorna um array vazio' do
        subject
        expect(JSON.parse(response.body)).to be_empty
      end
    end

    context 'com transaction types' do
      let!(:transaction_types) { create_list(:transaction_type, 3) }

      it 'retorna sucesso' do
        subject
        expect(response).to be_successful
      end

      it 'retorna um array com os transaction types' do
        subject
        expect(JSON.parse(response.body).count).to eq transaction_types.count
      end
    end
  end

  describe "GET /show" do
    subject { get transaction_type_url(id) }
    context 'com um id inexistente' do
      let!(:id) { 1 }

      it 'retorna não encontrado' do
        subject
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'com um id existente' do
      let!(:transaction_type) { create(:transaction_type) }
      let!(:id) { transaction_type.id }

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

  describe "POST /create" do
    subject { post transaction_types_url, params: { transaction_type: attributes } }

    context "com atributos válidos" do
      let! (:attributes) { build(:transaction_type).attributes }

      it 'retorna criado' do
        subject
        expect(response).to have_http_status(:created)
      end

      it "cria um novo tipo de transação" do
        expect{ subject }.to change(TransactionType, :count).by(1)
      end
    end

    context "com atributos inválidos" do
      let! (:attributes) { build(:transaction_type, code: nil).attributes }

      it 'retorna erro' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "não cria um novo tipo de transação" do
        expect{ subject }.to_not change(TransactionType, :count)
      end
    end
  end

  describe "PATCH /update" do
    subject { patch transaction_type_url(id), params: { transaction_type: attributes } }
    let!(:attributes) { nil }

    context 'com um id inexistente' do
      let!(:id) { 1 }

      it 'retorna não encontrado' do
        subject
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'com um id existente' do
      let!(:transaction_type) { create(:transaction_type) }
      let!(:id) { transaction_type.id }

      context "com atributos válidos" do
        let! (:attributes) { build(:transaction_type).attributes }

        it 'retorna sucesso' do
          subject
          expect(response).to be_successful
        end

        it "altera o objeto existente" do
          expect{ subject }.to change{transaction_type.reload.description}.to attributes['description']
        end
      end

      context "com atributos inválidos" do
        let! (:attributes) { build(:transaction_type, code: nil).attributes }

        it 'retorna erro' do
          subject
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "não altera o objeto existente" do
          expect{ subject }.to_not change{transaction_type.reload.attributes}
        end
      end
    end
  end

  describe "DELETE /destroy" do
    subject { delete transaction_type_url(id) }
    context 'com um id inexistente' do
      let!(:id) { 1 }

      it 'retorna não encontrado' do
        subject
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'com um id existente' do
      let!(:transaction_type) { create(:transaction_type) }
      let!(:id) { transaction_type.id }

      it 'retorna sucesso' do
        subject
        expect(response).to be_successful
      end

      it 'remove o registro' do
        expect{ subject }.to change(TransactionType, :count).by(-1)
      end
    end
  end
end
