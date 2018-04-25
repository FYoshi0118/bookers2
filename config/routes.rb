Rails.application.routes.draw do
  get '/' => 'home#top', as: 'home'
  get '/about' => 'home#about'

  devise_for :users

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update, :destroy]
end
