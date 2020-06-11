Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'sessions', 
    registrations: 'registrations'
  }

 

  root to: 'home#index'
  # resources :home, only: [:index] do
  #   collection do
  #     get :siteguide
  #   end
  # end


  get 'home#siteguide', to: 'home#index' 
  # 全てpages/indexを見にいくように設定する
  # get 'pages/page1', to: 'pages#index' 
  # get 'pages/page2', to: 'pages#index'

  resources :users
  resources :articles

end

