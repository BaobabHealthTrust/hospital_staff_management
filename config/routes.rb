Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  namespace :api do
    namespace :v1 do
      resources :allocations
      resources :roles
      resources :encounters
      post '/encounters/patient', to: 'encounters#get_patient_encounters'
      resources :patients
      resources :users
      post 'patients/search', to: 'patients#search'
      post 'users/search', to: 'users#search'
      post 'reports/patient_allocation', to: 'reports#staff_patient_allocation_count'
      post 'reports/encounters_by_staff', to: 'reports#get_patient_encounters_by_staff'
    end
  end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
