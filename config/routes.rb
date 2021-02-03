Rails.application.routes.draw do
  resources :session, only: [:new, :login, :logout]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'stack#index'

  #STACK FOLDER
  get 'callback', to: 'stack#callback', as: 'callback'
  
  #SESSIONS FOLDER
  get 'login', to: 'session#login', as: 'login'
  get 'create_session', to: 'session#create_session'
  get 'logout', to: 'session#logout', as: 'logout'

  #MOVEMENT TYPE FOLDER
  post 'create_type', to: 'movement_type#create'

  #EARNING TYPE FOLDER
  post 'create_earning', to: 'earning#create'

  #EXPENSE TYPE FOLDER
  post 'create_expense', to: 'expense#create'

  #SUBTYPE TYPE FOLDER
  post 'create_sub_type', to: 'sub_type#create'

  #USER FOLDER
  get 'new_account', to: 'user#new'
  post 'create_user', to: 'user#create'
end
