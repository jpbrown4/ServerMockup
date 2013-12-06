Demoserver::Application.routes.draw do

  get "api/:name", to: "api#show"
  post "api/:name", to: "api#show"
  
  resources :api

  root to: "api#index"
end
