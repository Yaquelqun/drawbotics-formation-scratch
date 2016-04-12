Rails.application.routes.draw do

root 'static_pages#home'

devise_for :users

resources :users do
  scope :module => "users" do
    resources :achievements, only: :index
  end
end

resources :courses
resources :chapters
resources :sessions
resources :attendances
end
