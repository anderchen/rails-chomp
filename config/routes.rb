Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  match '404', to: "errors#not_found", via: :all
  match '500', to: "errors#internal_server_error", via: :all
  # match '*unmatched_route', to: "errors#not_found", via: :all

  # get '/422', to: "errors#unacceptable"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'users/registrations' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: :show

  resources :products, except: [:edit, :update, :delete]  do
    resources :reviews, only: :create
    member do
      put :validate
    end
  end

  # resources :diets
end
