Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/about", to: "pages#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :experiences do
    resources :re
  end
  # root "articles#index"
end

Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [:new]
  end
end
