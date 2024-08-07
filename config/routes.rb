Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
    get 'user', to: 'users#show', as: :user_root
  end

  resources :foods, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :recipes, only: [:index, :new, :create, :show]

  resources :diaries, except: :show do
    collection do
      get 'date/:date', to: 'diaries#date', as: 'by_date'
      get 'edit/:date', to: 'diaries#edit_by_date', as: 'edit_by_date'
      patch 'update_by_date/:date', to: 'diaries#update_by_date', as: 'update_by_date'
    end
  end
end
