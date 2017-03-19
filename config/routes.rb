Rails.application.routes.draw do
  get 'omniauth_callbacks/facebook'

  devise_for :users, controllers: {
  	omniauth_callbacks: "omniauth_callbacks"
  }

  post '/custom_sign_up', to: "omniauth_callbacks#custom_sign_up"

  resources :expenses
  resources :expense_types
  root 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
