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
  match 'brews/:id/ispindles/parametrage', to: 'ispindles#parametrage', via: [:get], as: :parametrage
  match 'brews/:id/ispindles/parametrage/create_ispindle', to: 'ispindles#create_ispindle', via: [:get, :post], as: :create_ispindle
  match 'brews/:id/ispindles/parametrage/destroy_all', to: 'ispindles#destroy_all_ispindle', via: [:get, :delete], as: :destroy_all_ispindle
  match 'brews/:id/brew_steps/dash/dash', to: 'brew_steps#dash', via: [:get], as: :dash
  match 'brews/:id/brew_steps/update_step', to: 'brew_steps#update_step', via: [:get, :post], as: :update_step

  devise_for :users
  root to: 'pages#home'



  resources :brews, only: [:create, :index, :show]
  patch "brew_steps/:id", to: "brew_steps#update"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
