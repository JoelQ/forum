Forum::Application.routes.draw do
  root to: 'categories#index'
  resources :users, only: [:edit, :update, :show]
  resources :categories
end
