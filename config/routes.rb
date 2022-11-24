Rails.application.routes.draw do
  devise_for :users

  resources :tweets, except: [:edit, :update]

  root to: "tweets#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end