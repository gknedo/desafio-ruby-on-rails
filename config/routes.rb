# frozen_string_literal: true

Rails.application.routes.draw do
  resources :transaction_types
  resources :stores
  resources :transactions
  resources :batch_imports, only: [:index, :show, :create]
end
