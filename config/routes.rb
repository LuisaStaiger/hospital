Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
  root "doctors#index"
  get "doctor/:id", to: "doctors#show", as: "doctor"
  get "doctors/new", to: "doctors#new", as: "new_doctor"
  post "doctors", to: "doctors#create"
  get "doctors/:id/edit", to: "doctors#edit", as: "edit_doctor"
  patch "doctor/:id", to: "doctors#update"
  delete "doctor/:id", to: "doctors#destroy", as: "delete_doctor"

end
