Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tenants, only: [:index, :show, :update, :create, :delete]
  resources :apartments, only: [:index, :show, :update, :create, :delete]
  resources :leases, only: [:create, :delete]

end
