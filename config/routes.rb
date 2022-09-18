Rails.application.routes.draw do
  root 'page#index'
  get '/artists', to: 'artists#index'
  get '/art_works/new', to: 'art_work#new'
  post '/art_works', to: 'art_work#create'
  get 'artists/:id/art-works', to: 'art_work#index', as: :artist_art_works
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
