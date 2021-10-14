# frozen_string_literal: true

Rails.application.routes.draw do
  root controller: :personal_parsers, action: :index
  resources :personal_parsers
  devise_for :users
end
