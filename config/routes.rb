Rails.application.routes.draw do
  resources :beers
  match '/pages/profil', to: 'pages#profil', via: [:get], as: :profil


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
