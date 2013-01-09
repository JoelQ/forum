Forum::Application.routes.draw do
  root to: 'categories#index'
  resources :users, only: [:edit, :update, :show]
  resources :categories, only: [:index, :new, :edit, :create, :update, :destroy] do
    resources :topics
  end
  resources :topics, only: [] do
    resources :posts
  end
end
