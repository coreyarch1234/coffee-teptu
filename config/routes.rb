Rails.application.routes.draw do
  # get 'projects/index'
  #
  # get 'projects/show'
  #
  # get 'projects/new'
  #
  # get 'projects/create'
  #
  # get 'projects/edit'
  #
  # get 'projects/update'
  #
  # get 'sessions/new'

  root 'static_pages#home'

  resources :users do
      resources :projects
  end
  get  '/signup',  to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
