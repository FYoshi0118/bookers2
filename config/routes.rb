Rails.application.routes.draw do
  get '/' => 'home#top'
  get '/about' => 'home#about'

  # root 'users#show'

  devise_for :users

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :destroy]
end
