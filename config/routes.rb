Rails.application.routes.draw do
  get 'login' => 'sessions#new', as: :login
  match 'logout' => 'sessions#delete', as: 'logout', via: %i[get delete]
  match '/auth/:provider/callback' => 'sessions#create', via: %i[get post]

  root to: 'availability#index'
end
