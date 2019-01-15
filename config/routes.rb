Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: 'todos#index'
  #resources :users => needs to be below devise_for (conflict)
  resources :todos
  
end
