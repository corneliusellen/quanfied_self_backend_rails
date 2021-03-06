Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals, only: [:index] do
        get '/foods', to: 'meals#show'
        post '/foods/:food_id', to: 'meals#create'
        delete '/foods/:food_id', to: 'meals#destroy'
      end
    end
  end
end
