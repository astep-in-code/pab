Rails.application.routes.draw do
  # get 'brews/create'
  resources :beers, only: [:index, :show, :new, :destroy] do
    resources :brews, only: [:create]
  end
  resources :brews, only: [:index, :show, :destroy] do
    resources :ispindles, only: [:index] do
    end
  end
  match '/pages/profil', to: 'pages#profil', via: [:get], as: :profil


  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'



  resources :brews, only: [:create, :index, :show]
  patch "brew_steps/:id", to: "brew_steps#update"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
