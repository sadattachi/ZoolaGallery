Rails.application.routes.draw do
  root 'page#index'
  get '/artists', to: 'artists#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
