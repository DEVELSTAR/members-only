Rails.application.routes.draw do

  resources :posts, only: [:new, :create, :index]
  root 'posts#index'

end
