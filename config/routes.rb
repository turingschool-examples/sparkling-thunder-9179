Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/studios", to: "studios#index"

  get "/movies/:id", to: "movies#show"
  post "/movies/:id/actor_movies", to: "actor_movies#create"
end
