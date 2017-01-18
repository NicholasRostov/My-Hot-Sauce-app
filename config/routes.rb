Rails.application.routes.draw do
 get "/first_sauce", to: "products#first_sauce" 
 get "/all_sauces", to: "products#all_sauce"
end
