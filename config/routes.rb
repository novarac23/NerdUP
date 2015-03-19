Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    put 'like', to: "posts#upvote",  on: :member
    resources :comments
  end

  root to: 'posts#index'
end
