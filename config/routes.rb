Rails.application.routes.draw do

root 'static_pages#home'

# resources :users do
#     resources :achievements,  only: :index, controller: 'users/achievements'
# end

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
