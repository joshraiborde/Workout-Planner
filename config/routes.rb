Rails.application.routes.draw do
  get 'trainings/show'
  get 'trainings/new'
  get 'trainings/index'
  root 'sessions#index'
  
  #custom routes for login
  #creating a new session
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy' #this needs to be a delete action because you dont want '/logout' to be an option that can be typed in the url, but rather a button to click on a page

  #can't log in without a user
  #custom routes for signup
  #creating a new model object
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :workouts
  resources :trainings
  resources :races
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
