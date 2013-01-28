Forum::Application.routes.draw do
  scope '(:locale)', locale: /en|fr/ do
    resources :users, only: [:create, :edit, :update, :show]
    resources :categories, only: [:index, :new, :edit, :create, :update, :destroy] do
      resources :topics
    end
    resources :topics, only: [] do
      resources :posts
    end
  end

  namespace 'api' do
    resources 'posts', only: :index
  end

  match '/(:locale)' => 'categories#index', as: :root, locale: /en|fr/
end
