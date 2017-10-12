Rails.application.routes.draw do
  devise_for :users

  resources :patients do
    collection do
      get :show_date
    end
  end

  resources :notes

  resources :appointments

  resource :sessions, only: [:create, :destroy, :show]
end
