Forum::Application.routes.draw do
  root to: 'categories#index'
  resources :users, only: [:edit, :update, :show]
  resources :categories, except: :show do
    resources :topics
  end
  resources :topics, only: [] do
    resources :posts
  end
end
