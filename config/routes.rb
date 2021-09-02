Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :categories, only: [:index, :create, :update, :destroy]
  resources :income_and_expenditures
  root 'income_and_expenditures#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
