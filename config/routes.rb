Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'

  mount Commontator::Engine => '/commontator'

  resources :posts do
    member do
    put "like" => "posts#upvote"
    put "dislike" => "posts#downvote"
  end
  end
  
  resources :conversations do
    resources :messages
  end
  # root 'conversations#index'
end
