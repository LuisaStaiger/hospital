Rails.application.routes.draw do
  resources :patients
  resources :appointments

  resources :doctors do
    resources :educations, only: [:new, :create, :show, :edit]
  end

  root "pages#home"
  # get "doctor/:id", to: "doctors#show", as: "doctor"
  # get "doctors/new", to: "doctors#new", as: "new_doctor"
  # post "doctors", to: "doctors#create"
  # get "doctors/:id/edit", to: "doctors#edit", as: "edit_doctor"
  # patch "doctor/:id", to: "doctors#update"
  # delete "doctor/:id", to: "doctors#destroy", as: "delete_doctor"
end
