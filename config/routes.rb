Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'sessions', 
    registrations: 'registrations'
  }
  root to: 'home#index'
  resources :home, only: [:index] do
    collection do
      get :siteguide
    end
  end
  resources :users
  resources :articles
end

