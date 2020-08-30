# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'TransactionTypes' do
  get '/transaction_types' do
    context '200' do
      example_request 'Listar os tipos de transações' do
        expect(status).to eq 200
      end
    end
  end

  post '/transaction_types' do
    with_options scope: :transaction_type, with_example: true do
      parameter :code, required: true
      parameter :description, required: true
      parameter :income, default: true
    end

    let(:code) { 1 }
    let(:description) { 'Descrição da Operação' }
    let(:income) { true }

    context '201' do
      example_request 'Criar tipo de transação' do
        expect(status).to eq 201
      end
    end
  end

  get '/transaction_types/1' do
    let!(:transaction_type) { create(:transaction_type, id: 1) }
    context '200' do
      example_request 'Exibir um tipo de transação' do
        expect(status).to eq 200
      end
    end
  end

  patch '/transaction_types/1' do
    let!(:transaction_type) { create(:transaction_type, id: 1) }

    with_options scope: :transaction_type, with_example: true do
      parameter :code
      parameter :description
      parameter :income, default: true
    end

    let(:code) { 1 }
    let(:description) { 'Descrição da Operação' }
    let(:income) { true }

    context '200' do
      example_request 'Alterar um tipo de transação' do
        expect(status).to eq 200
      end
    end
  end

  delete '/transaction_types/1' do
    let!(:transaction_type) { create(:transaction_type, id: 1) }

    context '200' do
      example_request 'Deletar um tipo de transação' do
        expect(status).to eq 204
      end
    end
  end
end
