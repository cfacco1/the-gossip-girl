Rails.application.routes.draw do
  root 'gossips#index'
  get 'welcome/:user_name', to: 'welcome#user_name'
  get '/static_pages/contact', to: 'static_pages#contact'
  get '/static_pages/team', to: 'static_pages#team'
  resources :gossips
  resources :users
  resources :cities
  resources :comments
  resources :sessions, only: [:new, :create, :destroy] 
end
