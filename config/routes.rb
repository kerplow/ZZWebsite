Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resource :polls, only: [:create, :update], defaults: { format: :js}

  post ':model_name/:id/upvote', to: "votes#upvote", defaults: { format: :js }, as: :upvote

  post ':model_name/:id/downvote', to: "votes#downvote", defaults: { format: :js }, as: :downvote

  resources :planner_events,  defaults: {format: :js}

  resources :notes,  defaults: {format: :js}

  resources :pricetags,  defaults: {format: :js}, only: [:destroy] do
    member do
      put 'offer'
      put 'accept'
    end
  end

  devise_for :users

  resources :user, only: [:show, :edit, :update, :destroy] do
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"
end
