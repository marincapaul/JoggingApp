Rails.application.routes.draw do

  # get 'static_pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root    'static_pages#home'
  get     '/signup',    to: 'users#new'
  get     '/login',     to: 'sessions#new'
  get     '/report/:id',    to: 'users#report', as: 'report'
  post    '/login',     to: 'sessions#create'
  post    '/home',      to: 'static_pages#filter'
  get     '/home',      to: 'static_pages#home'
  delete  '/logout',    to: 'sessions#destroy'
  #get     'static_pages#home',     to: redirect('/runs/:id')

  resources :users 
  resources :runs,  only: [:create, :destroy,:edit, :update, :show]
end
