Rails.application.routes.draw do
  resources :customers
  resources :catalogs
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
