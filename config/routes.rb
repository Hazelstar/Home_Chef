Rails.application.routes.draw do
  devise_for :users , sign_out_via: [:delete, :get], controllers: { :registrations => :registrations, :sessions => :sessions, :cookers => :cookers }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/profile', to: 'pages#profile'
  patch '/edit_user_registration', to: 'pages#change_role'
  # delete '/users/sign_out', to: 'sessions#destroy'
  resources :cookers, only: [:index,:show ]

  resources :users, only: [:index] do
    resources :bookings, only: [ :new, :create ]
    resources :availabilities, only: [:index, :new, :create]
    resources :chatrooms, only: [:create, :new, :show, :index] do
      resources :messages, only: :create
    end
  end
  resources :availabilities, only: [:destroy]
  resources :bookings, only:[ :destroy, :show ]
end
