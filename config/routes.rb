Rails.application.routes.draw do

  root to: "products#index"

 get "/products", to:"products#index"
 get "products/new", to: "products#new"
 post "/products", to: "products#create"
 get "/products/:id", to: "products#show"
 get "/products/:id/edit", to: "products#edit"
 patch"/products/:id", to: "products#update"
 delete "/products/:id", to:"products#destroy"
 get "products/newimg", to:"products#show"

 # sign up routes
 get "/signup", to: "users#new"
 post "/users", to: "users#create"

 # user log in
 get "/login", to: "sessions#new"
 post "/login", to: "sessions#create"
 get "/logout", to: "sessions#destroy"

 # Orders
 get "/orders/:id", to:"orders#show"
 post "/orders", to: "orders#create"

 # Cart
 post "/cart", to: "carted_products#create"
 get "/cart", to: "carted_products#index"

end
