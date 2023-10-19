Rails.application.routes.draw do
  resources :users
  get "up" => "rails/health#show", as: :rails_health_check
  
  namespace :api do
    namespace :v1 do
      post "/auth", to: "authentication#auth"
      post "/auth/generate", to: "authentication#generate"
      
      # root "posts#index"
    end
  end
end
