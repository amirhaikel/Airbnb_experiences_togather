Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/about", to: "pages#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  resources :experiences do
    resources :bookings, only: [:new, :create, :show, :index, :edit, :update]
    resources :bookings, only: [:destroy], as: :booking_destroy
  end

  resources :bookings do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end
  # root "articles#index"
end
