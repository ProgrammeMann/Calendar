Rails.application.routes.draw do
  devise_for :users
  resources :meetings
  root 'meetings#index'
  # get 'persons/profile', as: 'user_root'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
