Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]

  resources :items do
    resources :likes, only: [:create,]
    resources :comments
  end

  resources :notifications, only: :index
  resources :tops, only: [:index]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root 'tops#index'
end
