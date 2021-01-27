Rails.application.routes.draw do
  get '/', to: 'pages#index'

  get '/spells', to: 'spells#index', as: 'spells'
  post '/spells', to: 'spells#create'
  get 'spells/new', to: 'spells#new', as: 'new_spell'
  get '/spells/:id', to: 'spells#show', as: 'spell'
  put '/spells/:id', to: 'spells#update'
  delete '/spells/:id', to: 'spells#destroy'
  
end
