Rails.application.routes.draw do

root 'static_pages#home'

resources :users
resources :courses
resources :chapters
resources :sessions
resources :attendances
end
