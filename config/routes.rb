Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'individuals', to: 'users/registrations#new_individual'
    post 'individuals', to: 'users/registrations#create_individual'
  end
  root to: 'homes#index'
  resources :residents, only: :index
  resources :applicants, only: :index
  resources :rooms, only: [:new, :create]
  resources :buildings, only: [:new, :create]
  resources :homes, only: :show do
    collection do
      get 'search'
    end
  end
end
