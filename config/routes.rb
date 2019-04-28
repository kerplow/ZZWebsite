Rails.application.routes.draw do

  post '/upvote', to: "votes#upvote", defaults: { format: :json }

  post '/downvote', to: "votes#downvote", defaults: { format: :json }

  resources :planner_events,  defaults: {format: :json}

  resources :notes,  defaults: {format: :json}

  resources :pricetags,  defaults: {format: :json}, only: [:destroy] do
    member do
      put 'offer'
      put 'accept'
    end
  end

  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      put 'act_as/:act_as', to: "users#act_as", as: 'act_as_status'
    end
  end


  get '/tikkie', to: "pages#tikkie"

  get '/about', to: 'pages#about'

  get '/lists', to: 'pages#lists'

  resources :lists, only: [:new, :create, :update, :destroy],  defaults: { format: :js } do
    resources :options, defaults: { format: :js }
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"
end
