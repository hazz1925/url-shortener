Rails.application.routes.draw do
  root 'urls#new'

  get 'urls/new'
  post 'urls/create'
  # resources :urls
  get '/hz/:short_url', to: 'urls#show', as: 'urls_show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
