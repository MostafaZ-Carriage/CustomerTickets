Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :admins, only: [:index, :show, :create, :update, :destroy]
  resources :agents, only: [:index, :show, :create, :update, :destroy]
  resources :customers, only: [:index, :show, :create, :update, :destroy]
  resources :tickets, only: [:index, :show, :create, :update, :destroy]
end
