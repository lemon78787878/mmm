Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
    get 'user', to: 'users#show', as: :user_root
  end
  resources :foods, only: :index

  


end
