Rails.application.routes.draw do
  	get 'welcome/:user_name', to: 'welcome#user_name'
  	root 'home#gossip'
  	get '/static_pages/contact', to: 'static_pages#contact'
	get '/static_pages/team', to: 'static_pages#team'
end
