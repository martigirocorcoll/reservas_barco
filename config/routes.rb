Rails.application.routes.draw do
  get '/calendar', to: 'pages#home'
  resources :bookings
  root to: 'bookings#index'
  get '/eolo-bookings', to: 'bookings#index_eolo'
  get '/barqa-bookings', to: 'bookings#index_barqa'
  get '/facturas', to: 'bookings#facturas', as: 'facturas'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
