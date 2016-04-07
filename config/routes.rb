Rails.application.routes.draw do

root 'static_pages#home'

get 'listUsers' => 'users#index'
get 'listCourses' => 'courses#index'

resources :users
resources :courses
resources :chapters
resources :sessions
resources :attendances
end
