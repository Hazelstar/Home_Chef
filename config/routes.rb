Rails.application.routes.draw do
  devise_for :users #, controllers: { :registrations => :registrations }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/profile', to: 'pages#profile'
  patch '/edit_user_registration', to: 'pages#edit_profile'

  resources :users do
    resources :bookings, only: [ :new, :create ]
    resources :availabilities, only: [:show, :new, :create, :update]
  end

  resources :bookings, only:[ :destroy, :show ]
end
