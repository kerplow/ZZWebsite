Rails.application.routes.draw do
  resources :planner_events, only: [:create, :update, :destroy]

  resources :users

  resources :notes, only: [:create, :update, :destroy]

  get '/tikkie', to: "pages#tikkie"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"
end
