Rails.application.routes.draw do
  get '/' => 'home#top'
  get '/about' => 'home#about'

  devise_for :users
end
