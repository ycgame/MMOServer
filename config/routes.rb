Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'

  # User model
  resources :users
  # Login
  post '/users/:id/login' => 'users#login'

end
