Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/studios", to: "studios#index"
  get "movies/:id", to: "movies#show"
  get "movies/:id", to: "movies#new"
  post "movies/:id", to: "movies#create"
end
