Rails.application.routes.draw do
  root 'daily_menus#index'
  
  resources :daily_menus, only: [:index, :new, :show,:create, :destroy ]
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  
  
end
