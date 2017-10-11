Rails.application.routes.draw do
  devise_for :users

  resources :patients

  resources :notes

  resources :appointments

  resource :sessions, only: [:create, :destroy]

end
