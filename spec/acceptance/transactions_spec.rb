# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Transactions' do
  get '/transactions' do
    context '200' do
      example_request 'Listar as transações' do
        expect(status).to eq 200
      end
    end
  end

  post '/transactions' do
    with_options scope: :transaction, with_example: true do
      parameter :store_id, required: true
      parameter :transaction_type_id, required: true
      parameter :value, required: true
      parameter :cpf, required: true
      parameter :card, required: true
      parameter :transacted_at
    end

    let(:store_id) { create(:store).id }
    let(:transaction_type_id) { create(:transaction_type).id }
    let(:value) { 99999 }
    let(:cpf) { 99999999999 }
    let(:card) { '9999999999999999' }
    let(:transacted_at) { Time.zone.now }

    context '201' do
      example_request 'Criar transação' do
        expect(status).to eq 201
      end
    end
  end

  get '/transactions/1' do
    let!(:transaction) { create(:transaction, id: 1) }
    context '200' do
      example_request 'Exibir uma transação' do
        expect(status).to eq 200
      end
    end
  end

  patch '/transactions/1' do
    let!(:transaction) { create(:transaction, id: 1) }

    with_options scope: :transaction, with_example: true do
      parameter :store_id
      parameter :transaction_type_id
      parameter :value
      parameter :cpf
      parameter :card
      parameter :transacted_at
    end

    let(:store_id) { create(:store).id }
    let(:transaction_type_id) { create(:transaction_type).id }
    let(:value) { 99999 }
    let(:cpf) { 99999999999 }
    let(:card) { '9999999999999999' }
    let(:transacted_at) { Time.zone.now }

    context '200' do
      example_request 'Alterar uma transação' do
        expect(status).to eq 200
      end
    end
  end

  delete '/transactions/1' do
    let!(:transaction) { create(:transaction, id: 1) }

    context '200' do
      example_request 'Deletar uma transação' do
        expect(status).to eq 204
      end
    end
  end
end
