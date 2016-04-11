Rails.application.routes.draw do

root 'static_pages#home'

get 'user_achievements' => 'users#achievements'

resources :users
resources :courses
resources :chapters
resources :sessions
resources :attendances
end
