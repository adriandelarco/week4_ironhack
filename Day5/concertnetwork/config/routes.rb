Rails.application.routes.draw do
    resources :concerts  do
    	resources :comments
    end
    post '/concerts/search_by_price/' => 'concerts#search_by_price'
end
