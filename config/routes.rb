ZillowClone::Application.routes.draw do
  resources :listings

  devise_for :users

  root to: 'static_pages#home'

  get 'help', to: 'static_pages#help'

  resources :users, only: [:show]
end
