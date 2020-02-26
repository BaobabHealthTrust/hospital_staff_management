Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  namespace :api do
    namespace :v1 do
      resources :allocations
      resources :roles
      resources :encounters
      resources :patients
      resources :users
      post 'patients/search', to: 'patients#search'
    end
  end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
