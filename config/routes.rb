Rails.application.routes.draw do
  root to: "main#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:index, :show]
    end
  end
end
