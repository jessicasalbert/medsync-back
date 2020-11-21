Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :doctors
      post '/login', to: 'auth#create'
      post '/patientlogin', to: 'auth#createpatient'
      get '/mdprofile', to: 'doctors#profile'
      get '/ptprofile', to: 'patients#profile'
    end
  end
end