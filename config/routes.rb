Rails.application.routes.draw do
  resources :guests, only: [:index, :show, :update]
  resources :parties, only: [:index, :show, :update]

  post '/admin/parties', to: 'parties#create'
  put '/admin/parties/:id', to:'parties#update'
  delete '/admin/parties/:id', to:'parties#destroy'

  post '/admin/guests', to: 'guests#create'
  put '/admin/guests/:id',to: 'guests#edit'
  delete '/admin/guests/:id', to:'guests#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
