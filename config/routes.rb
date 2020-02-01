Rails.application.routes.draw do
  resources :beers, only: [:index, :show]
  resources :brews, only: [:create, :index, :show]
  patch "brew_steps/:id", to: "brew_steps#update"

  match '/pages/profil', to: 'pages#profil', via: [:get], as: :profil


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
