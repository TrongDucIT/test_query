Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/create', to: 'users#create'
  delete '/destroy', to: 'users#destroy'
  post '/update', to: 'users#update'

  post '/user_posts', to: 'user_posts#create'
  post '/destroy_posts', to: 'user_posts#destroy'
end
