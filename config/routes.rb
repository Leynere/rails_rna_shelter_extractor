Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "api/hello-world", action: :index, controller: "api/hello_world"
  get "api/scrap/scrap-test", action: :index, controller: "api/scrap/scrap_test"
  get "api/scrap/gouv", action: :index, controller: "api/scrap/gouv"
  get "api/scrap/association", action: :index, controller: "api/scrap/association"
  post "api/scrap/association", action: :create, controller: "api/scrap/association"
end
