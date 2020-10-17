Rails.application.routes.draw do
  devise_for :users

  resources :items do
    resources :likes, only: [:create, :destroy]
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root 'items#index'
end
