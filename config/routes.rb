Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'sessions', 
    registrations: 'registrations'
  }

  root to: 'home#index'
  resources :users
  resources :articles

end
