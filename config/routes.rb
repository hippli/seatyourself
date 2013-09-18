Seatyourself::Application.routes.draw do
  root "home#index"
   
  resources :owners, except: :index
  resources :sessions, only: [:new, :create, :destroy]
end