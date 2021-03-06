Rails.application.routes.draw do

  get 'sessions/new'


  get 'users/new'

  root 'static_pages#home'

  get '/json', to: 'users#prog_output.json'

  get '/pdfviewer', to: 'static_pages#pdfviewer'

  get '/help', to: 'static_pages#help'

  get '/about', to: 'static_pages#about'

  get '/aboutus', to: 'static_pages#aboutus'

  get '/contact', to: 'static_pages#contact'

  get '/signup', to: 'users#new'

  post 'signup', to: 'users#create'

  get '/edit', to: 'users#edit'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/newdocument', to: 'documents#new'

  post '/showdocument', to: 'document#show'

  post '/search', to: 'users#search'



  resources :users

  resources :documents, only: [:create, :destroy]
  resources :microposts,          only: [:create, :destroy]

end
