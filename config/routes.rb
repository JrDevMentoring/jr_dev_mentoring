Rails.application.routes.draw do
  resources :internships, except: :show

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,:controllers => { :registrations => "users/registrations" }
  resources :users do
    resource :profile
  end
  get '/connections/new/:profile_id' => "connections#new", as: :new_connections
  resources :contacts
  get '/about' => 'pages#about'
  namespace :mentee do
    root 'pages#home'
    get '/mentor_profiles' => 'profiles#mentor_profiles'
  end
  namespace :mentor do
    root 'pages#home'
    get '/mentee_profiles' => 'profiles#mentee_profiles'
  end
  root 'pages#home'

	match '*path', :to => 'application#routing_error', via: [:get, :post]
end
