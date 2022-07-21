Rails.application.routes.draw do
  root to: "main#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end
end
