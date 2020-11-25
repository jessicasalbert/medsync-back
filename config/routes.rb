Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :doctors, only: [:show]
      resources :patients, only: [:show]
      resources :meds, only: [:index]
      resources :patient_meds, only: [:update, :destroy, :create]
      resources :messages, only: [:create]
      resources :conversations, only: [:show]
      post '/login', to: 'auth#create'
      post '/patientlogin', to: 'auth#createpatient'
      get '/mdprofile', to: 'doctors#profile'
      get '/ptprofile', to: 'patients#profile'
    end
  end
end