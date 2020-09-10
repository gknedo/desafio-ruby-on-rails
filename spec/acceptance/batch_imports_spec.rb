# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Importações em Lote' do
  get '/batch_imports' do
    context '200' do
      example_request 'Listar as importações' do
        expect(status).to eq 200
      end
    end
  end

  post '/batch_imports' do
    with_options with_example: true do
      parameter :file, required: true
    end

    let(:file) { File.open('/opt/app/CNAB.txt') }

    context '201' do
      example_request 'Criar importação' do
        expect(status).to eq 201
      end
    end
  end
end
