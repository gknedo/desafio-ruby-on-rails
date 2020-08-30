# frozen_string_literal: true

Rails.application.routes.draw do
  resources :transaction_types
  resources :stores
end
