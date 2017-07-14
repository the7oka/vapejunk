Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations", :sessions => "sessions", confirmations: 'confirmations'}
  	devise_scope :user do
  		get "/users/sign_out" => "devise/sessions#destroy"
  	end
  	resources :recipes
  	get 'showrecipe/:id' => 'recipes#showrecipe'
  	get 'myrecipes' => 'recipes#myrecipes'
    get 'mybuilds' => 'builds#mybuilds'
  	root 'recipes#index'

    resources :builds
  	get 'profile/:id' => 'profile#show'
    get 'recipes/:id/destroy' => 'recipes#destroy'
    get 'builds/:id/destroy' => 'builds#destroy'
end
