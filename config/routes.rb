# frozen_string_literal: true

Rails.application.routes.draw do
  root controller: :entities, action: :index
  resources :entities
  devise_for :users
  get 'download_pdf', to: "entites#download_pdf"
end
