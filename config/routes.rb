Rails.application.routes.draw do
  devise_for :users
  root to: 'devise/sessions#new'
  resources :users, only: :show
  resources :foods, only: :index

  


end
