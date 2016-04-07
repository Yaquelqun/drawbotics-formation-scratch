Rails.application.routes.draw do

root 'static_pages#home'

get 'addUser' => 'users#new'
get 'listUsers' => 'users#index'
resources :users
resources :courses
resources :chapters
resources :sessions
resources :attendances
end
