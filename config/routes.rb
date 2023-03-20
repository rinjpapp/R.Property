Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'individuals', to: 'users/registrations#new_individual'
    post 'individuals', to: 'users/registrations#create_individual'
  end
  root to: 'homes#index'
end
