Rails.application.routes.draw do
  root to: 'books#top'
  get '/books/about',to: 'books#about', as:'about'
  devise_for :users
  resources :users, only: [:index,:show,:edit,:update]
  resources :books, only: [:edit,:update,:create,:index,:show,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
