Rails.application.routes.draw do
  root 'page#index'
  get '/artists', to: 'artists#index'
  resources :art_works, only: %i[new edit create update destroy]
  get 'artists/:id/art-works', to: 'art_works#index', as: :artist_art_works
  devise_for :users,
             controllers: {
               registrations: 'users/registrations'
             }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
