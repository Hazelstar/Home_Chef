Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do 
    resources :bookings, only: [ :new, :create ]
    resources :availabilities, only: [:show, :new, :create, :update]
  end

  resources :bookings, only:[ :destroy, :show ]
end
