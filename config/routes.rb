Rails.application.routes.draw do

  devise_for :users,
    controllers: {
      sessions: 'devise/sessions'
                 }
  root 'posts#index'

  # Social login success
  get '/users/auth/:provider/callback', to: 'devise/sessions#social_login'
  # Social login failure:
  get "/users/auth/failure" => "devise/sessions#social_failure"

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
