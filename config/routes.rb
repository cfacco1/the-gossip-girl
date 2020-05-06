Rails.application.routes.draw do
  resources :gossips
    get 'welcome/:user_name', to: 'welcome#user_name'
    get '/static_pages/contact', to: 'static_pages#contact'
  get '/static_pages/team', to: 'static_pages#team'
end
