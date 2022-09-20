Rails.application.routes.draw do
  root 'page#index'
  get '/artists', to: 'artists#index'
  resources :art_works, only: %i[new edit create update destroy]
  # get '/art_works/new', to: 'art_work#new'
  # post '/art_works', to: 'art_work#create', as: :art_work
  # patch '/art_works', to: 'art_work#update'
  # get '/art_works/:id/edit', to: 'art_work#edit', as: :edit_art_word
  # delete '/art_works/:id', to: 'art_work#destroy', as: :delete_art_work
  get 'artists/:id/art-works', to: 'art_works#index', as: :artist_art_works
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
