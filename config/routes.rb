Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
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
  resources :buildings, only: [:new, :create, :edit, :update] do
    resources :rooms, only: [:new, :create, :show, :edit, :update]
  end
  resources :homes, only: :show do
    collection do
      get 'search'
    end
  end
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
end
