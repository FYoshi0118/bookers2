Rails.application.routes.draw do
  get '/' => 'home#top'
  get '/about' => 'home#about'

  devise_for :users

  resources :books, only: [:new, :create, :index, :show]
end
