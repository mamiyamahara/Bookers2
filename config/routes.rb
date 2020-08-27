Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  get 'home/about'
  devise_for :users

  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]

end
