Rails.application.routes.draw do
  
  

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    unlocks: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/confirmations',

  }
  devise_scope :user do
    authenticated :user do
      root "products#index", as: :authenticated_root
    end
    
    unauthenticated do 
      root 'users/sessions#new', as: :unauthenticated_root
    end

  end



  resources :products, only: %i[index new create show update edit] do 
     
    member do 
      get :stock
      post :change_stock      
    end
  end
  resources :providers, only: %i[index new create destroy update edit]
  resources :categories, only: %i[index new create destroy update edit]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
