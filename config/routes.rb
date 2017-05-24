Rails.application.routes.draw do
  resources :internships, except: :show

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users do
    resource :profile
  end

  get '/connections/new/:profile_id' => "connections#new", as: :new_connections
  resources :contacts
  resources :communities, only: :index
  get '/about' => 'pages#about'
  get "/jrdevslack" => redirect("https://slackpass.io/jr-dev-mentoring")

  authenticated :user do
    root 'pages#dashboard', as: :authenticated_root
  end

  root 'pages#home'



	match '*path', :to => 'application#routing_error', via: [:get, :post]
end
