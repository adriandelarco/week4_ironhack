Rails.application.routes.draw do
	get '/' => 'contacts#index'
 	post '/contacts' => 'contacts#create'
    get '/contacts/favorites' => 'contacts#favorites'
    post '/contacts/:id/fav' => 'contacts#fav'
    post '/contacts/search/beginning_with' => 'contacts#search_beginning_with'

    resources :contacts, only: [:index,:new,:show]
end