Rails.application.routes.draw do

root 'static_pages#home'

get 'user_achievments' => 'users#achievments'

resources :users
resources :courses
resources :chapters
resources :sessions
resources :attendances
end
