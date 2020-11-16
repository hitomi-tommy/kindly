Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :items do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end

  resources :notifications, only: :index
  resources :tops, only: [:index]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'tops#index'
end
