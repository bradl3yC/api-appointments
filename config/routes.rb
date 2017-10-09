Rails.application.routes.draw do
  resources :patients do
    get :index
  end

  resources :notes do
    get :index
  end

  resources :appointments do
    get :index
  end

end
