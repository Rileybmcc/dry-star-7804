Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :doctors, only: %i[show]
  resources :patient_doctors, only: %i[destroy]


end
