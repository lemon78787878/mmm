Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
    get 'user', to: 'users#show', as: :user_root
  end
  resources :foods, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :recipes, only: [:new, :create, :show]
  resources :diaries, only: [:index, :create, :show, :edit, :update, :destroy]
  get 'diaries/date/:date', to: 'diaries#date', as: 'diaries_by_date'
  get 'diaries/edit/:date', to: 'diaries#edit_by_date', as: 'edit_diaries_by_date'
  patch 'diaries/update_by_date/:date', to: 'diaries#update_by_date', as: 'update_diaries_by_date'


end
