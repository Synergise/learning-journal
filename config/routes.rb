# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'
  resources :glossaries

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
