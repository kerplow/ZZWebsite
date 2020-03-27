Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"

  get '/tikkie', to: "pages#tikkie"
  get '/about' , to: 'pages#about'
  get '/lists' , to: 'pages#lists'
  get '/corona', to: 'pages#corona'

  devise_for :users
  resources :planner_events, only: [:new, :create, :edit, :update, :destroy]
  resources :notes         , only: [:new, :create, :edit, :update, :destroy]
  resources :lists         , only: [:new, :create, :edit, :update, :destroy] do
    resources :options     , only: [:new, :create, :edit, :update, :destroy]
  end

  resources :shopping_lists  , only: [:new, :create, :edit, :update, :destroy] do
    resources :shopping_items, only: [:new, :create, :edit, :update, :destroy]
  end

  post '/upvote'  , to: "votes#upvote"  , defaults: { format: :js }
  post '/downvote', to: "votes#downvote", defaults: { format: :js }

  resources :opruimlijst, only: [:index, :edit] do
    member do
      post '/switch', to: "opruimlijst#switch", as: :switch_task
    end
  end

  # resources :pricetags,  defaults: {format: :json}, only: [:destroy] do
  #   member do
  #     put 'offer'
  #     put 'accept'
  #   end
  # end
end
