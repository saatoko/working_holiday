Rails.application.routes.draw do
  root to: 'home#index'
  resources :home, only: [:index] do
    collection do
      get :siteguide
    end
  end
  # resources :users
  # resources :articles

  namespace :api do
    post   'refresh', controller: :refresh,  action: :create
    post   'signin',  controller: :signin,   action: :create
    post   'signup',  controller: :signup,   action: :create
    delete 'signin',  controller: :signin,   action: :destroy
  end
end

