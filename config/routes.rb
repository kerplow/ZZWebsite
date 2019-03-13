Rails.application.routes.draw do
  get 'votes_controller/create'

  resources :planner_events

  resources :notes

  resources :user, only: [:show, :edit, :update, :destroy]

  resources :pricetags, only: [:destroy] do
    member do
      put 'offer'
      put 'accept'
    end
  end

  get '/tikkie', to: "pages#tikkie"

  get '/about', to: 'pages#about'

  get '/lists', to: 'pages#lists'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"
end
