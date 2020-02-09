Rails.application.routes.draw do
  resources :beers, only: [:index, :show, :new, :destroy] do
    resources :brews, only: [:new, :create, :show] do
    end
  end
  resources :brews, only: [:index, :destroy]
  match '/pages/profil', to: 'pages#profil', via: [:get], as: :profil


  devise_for :users
  root to: 'pages#home'



  resources :brews, only: [:create, :index, :show]
  patch "brew_steps/:id", to: "brew_steps#update"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
