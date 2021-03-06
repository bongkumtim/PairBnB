Rails.application.routes.draw do
  
  root "static_pages#home"
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  
  resources :braintree, only: [:new]
  post 'braintree/checkout' => 'braintree#checkout'
  
  resources :listings
  resources :reservations
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback"=>"sessions#create_from_omniauth"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
