Forum::Application.routes.draw do
  root to: 'topics#index'
  resources :users, only: [:edit, :update, :show]
end
