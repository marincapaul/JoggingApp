Rails.application.routes.draw do
  get 'users/new'
  # get 'static_pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  resources :users

end
