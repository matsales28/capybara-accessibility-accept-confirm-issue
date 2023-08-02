Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Define the root path route ("/")
  root "roots#index"
  resource :root
end
