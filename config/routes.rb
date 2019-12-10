Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"

  get '/tikkie', to: "pages#tikkie"
  get '/about', to: 'pages#about'
  get '/lists', to: 'pages#lists'

  devise_for :users
  resources :planner_events, only: [:new, :create, :edit, :update, :destroy]
  resources :notes, only: [:new, :create, :edit, :update, :destroy]
  resources :lists, only: [:new, :create, :edit, :update, :destroy] do
    resources :options, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :lost_and_found, only: [:index, :create, :update, :show, :destroy]

  post '/upvote', to: "votes#upvote", defaults: { format: :js }
  post '/downvote', to: "votes#downvote", defaults: { format: :js }

  # resources :pricetags,  defaults: {format: :json}, only: [:destroy] do
  #   member do
  #     put 'offer'
  #     put 'accept'
  #   end
  # end
end
