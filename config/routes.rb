Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  get 'static_pages/help'

  resources :tournaments
  devise_for :users
  resources :players
  resources :articles
  get 'welcome/index'
  #get 'tournament/remove/player
  #root 'welcome#index'
  root 'tournaments#index'
  #get 'tournaments#ranking'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
