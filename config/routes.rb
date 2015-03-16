Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    put 'like', to: "posts#upvote",  on: :member
  end

  root to: 'posts#index'
end
