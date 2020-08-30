require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "TransactionTypes" do
  get "/transaction_types" do
    context '200' do
      example_request "Listar os tipos de transações" do
        expect(status).to eq 200
      end
    end
  end

  post "/transaction_types" do
    with_options scope: :transaction_type, with_example: true do
      parameter :code, type: :integer, required: true
      parameter :description, type: :string, required: true
      parameter :income, type: :boolean, default: true
    end

    let(:code) { 1 }
    let(:description) { "Descrição da Operação" }
    let(:income) { true }

    context '201' do
      example_request "Criar tipo de transação" do
        expect(status).to eq 201
      end
    end
  end
end
