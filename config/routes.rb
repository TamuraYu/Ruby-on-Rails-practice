Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"
  get "forbeginner" => "top#forbeginner", as: "forbeginner"
  get "admin" => "admin#top", as: "admin"
  get "treasure" => "searches#treasure", as: "treasure"
  get "exit" => "searches#exit", as: "exit"
  get "error" => "share#error", as: "error"

  #get "lesson/:action(/:name)" => "lesson"
  resources :users do
    collection { get "search" }
  end
  resources :articles
  resources :songs
  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :search
end