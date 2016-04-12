Rails.application.routes.draw do

root 'static_pages#home'

devise_for :users, :controllers => { :passwords => "users/passwords", :confirmations => "users/confirmations" }

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
