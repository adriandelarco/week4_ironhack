Rails.application.routes.draw do
  get '/', to: 'site#home'
  get '/text_inspections/new', to: 'textinspector#new'
  post '/text_inspections', to: 'textinspector#create'
  get '/asciis/new', to: 'asciis#new'
  post '/asciis', to: 'asciis#create'
  get '/trambolikoipsum/new', to: 'trambolikoipsum#new'
  post '/trambolikoipsum', to: 'trambolikoipsum#create'
end