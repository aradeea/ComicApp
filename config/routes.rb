Rails.application.routes.draw do
  devise_for :users
  resources :comics, except: [:destroy] do
    delete '/:id', to: 'comics#destroy', as: 'delete', on: :collection
  end

  get "/users/:user_id", to: "users#show", as: 'user_profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/transactions/", to: 'transactions#index'
  post "/transactions/", to: 'transactions#create'
end
