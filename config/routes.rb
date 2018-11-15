Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: :show

  resources :products do
    resources :reviews, only: :create
    member do
      put :validate
    end
  end

  resources :diets

end
