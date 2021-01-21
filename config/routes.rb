Rails.application.routes.draw do
  get '/', to: 'pages#index'

  get '/spells', to: 'spells#index'
  post '/spells', to: 'spells#create'
  get '/spells/:id', to: 'spells#show'
  put '/spells/:id', to: 'spells#update'
  delete '/spells/:id', to: 'spells#delete'
  
end
