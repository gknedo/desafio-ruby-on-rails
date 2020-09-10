# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Stores' do
  get '/stores' do
    context '200' do
      example_request 'Listar as lojas' do
        expect(status).to eq 200
      end
    end
  end

  post '/stores' do
    with_options scope: :store, with_example: true do
      parameter :name, required: true
      parameter :owner_name, required: true
    end

    let(:name) { 'Nome da loja' }
    let(:owner_name) { 'Nome do dono da loja' }

    context '201' do
      example_request 'Criar loja' do
        expect(status).to eq 201
      end
    end
  end

  get '/stores/1' do
    let!(:store) { create(:store, id: 1) }
    context '200' do
      example_request 'Exibir uma loja' do
        expect(status).to eq 200
      end
    end
  end

  patch '/stores/1' do
    let!(:store) { create(:store, id: 1) }

    with_options scope: :store, with_example: true do
      parameter :name
      parameter :owner_name
    end

    let(:name) { 'Nome da loja' }
    let(:owner_name) { 'Nome do dono da loja' }

    context '200' do
      example_request 'Alterar uma loja' do
        expect(status).to eq 200
      end
    end
  end

  delete '/stores/1' do
    let!(:store) { create(:store, id: 1) }

    context '200' do
      example_request 'Deletar uma loja' do
        expect(status).to eq 204
      end
    end
  end
end
