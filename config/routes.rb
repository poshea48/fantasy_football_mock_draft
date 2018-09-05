Rails.application.routes.draw do
  root to: 'players#index'
  resources :players
  resources :my_players
  post 'players/update_pick_number', to: 'players#update_pick_number'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
