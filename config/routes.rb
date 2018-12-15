Rails.application.routes.draw do
  root 'urls#new'

  get 'urls/new'
  post 'urls/create'
  # resources :urls
  # match '/load',      to: 'load#create',        via: 'post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
