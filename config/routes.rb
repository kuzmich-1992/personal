# frozen_string_literal: true

Rails.application.routes.draw do
  root controller: :entities, action: :index
  resources :entities
  devise_for :users
end
