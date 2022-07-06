Rails.application.routes.draw do
  
  root to: 'toppages#index'
  get 'achievement', to: 'toppages#achievement'
  get 'character_total_ranking', to: 'toppages#character_total_ranking'
  get 'character_max_ranking', to: 'toppages#character_max_ranking'
  get 'character_average_ranking', to:'toppages#character_average_ranking'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:create, :show, :edit, :update, :destroy]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :character_categories, only: [:index, :show]
  
  resources :action_types, only: [:show]
  
  post 'characters/random', to: 'characters#random'
  post 'characters/random_destroy', to: 'characters#random_destroy'
  resources :characters, only: [:show]
  
  get 'ranks/:rank_id/stages/:stage_id', to: 'stages#show'
  resources :ranks, only: [:index, :show]
  
  get 'battle_records/new/:character_id', to: 'battle_records#new'
  post 'battle_records/:character_id', to: 'battle_records#create'
  resources :battle_records, only: [:index, :edit, :update, :destroy]
  
end
