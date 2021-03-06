# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lines, only: %i[index]
  resources :users, only: %i[index create show]
  resources :locations, only: %i[index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
