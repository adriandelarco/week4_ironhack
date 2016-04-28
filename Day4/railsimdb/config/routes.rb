Rails.application.routes.draw do
    resources :movies, only: [:index]
    post '/movies/search' => 'movies#search'
    get '/movies/show/:id' => 'movies#show'
    post '/movies/new' => 'movies#create'
    post '/movies/comments/create' => 'comments#create'
    post '/users/login' => 'users#login'
end