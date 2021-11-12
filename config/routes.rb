Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: [:show] do
    resources :patients, only: [:destroy], controller: "doctor_patients" 
  end
  resources :hospitals, only: [:show]
  resources :patients, only: [:index]
end
