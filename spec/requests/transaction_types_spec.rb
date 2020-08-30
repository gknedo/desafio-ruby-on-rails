require 'rails_helper'

RSpec.describe "/transaction_types", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      TransactionType.create! valid_attributes
      get transaction_types_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      transaction_type = TransactionType.create! valid_attributes
      get transaction_type_url(transaction_type), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new TransactionType" do
        expect {
          post transaction_types_url,
               params: { transaction_type: valid_attributes }, headers: valid_headers, as: :json
        }.to change(TransactionType, :count).by(1)
      end

      it "renders a JSON response with the new transaction_type" do
        post transaction_types_url,
             params: { transaction_type: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new TransactionType" do
        expect {
          post transaction_types_url,
               params: { transaction_type: invalid_attributes }, as: :json
        }.to change(TransactionType, :count).by(0)
      end

      it "renders a JSON response with errors for the new transaction_type" do
        post transaction_types_url,
             params: { transaction_type: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested transaction_type" do
        transaction_type = TransactionType.create! valid_attributes
        patch transaction_type_url(transaction_type),
              params: { transaction_type: invalid_attributes }, headers: valid_headers, as: :json
        transaction_type.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the transaction_type" do
        transaction_type = TransactionType.create! valid_attributes
        patch transaction_type_url(transaction_type),
              params: { transaction_type: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq("application/json")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the transaction_type" do
        transaction_type = TransactionType.create! valid_attributes
        patch transaction_type_url(transaction_type),
              params: { transaction_type: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested transaction_type" do
      transaction_type = TransactionType.create! valid_attributes
      expect {
        delete transaction_type_url(transaction_type), headers: valid_headers, as: :json
      }.to change(TransactionType, :count).by(-1)
    end
  end
end
