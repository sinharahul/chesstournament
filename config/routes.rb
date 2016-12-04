Rails.application.routes.draw do
  resources :tournaments
  devise_for :users
  resources :players
  resources :articles
  get 'welcome/index'
  #get 'tournament/remove/player
  #root 'welcome#index'
  root 'tournaments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
