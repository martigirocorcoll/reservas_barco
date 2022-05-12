Rails.application.routes.draw do
  resources :bookings
  root to: 'bookings#index'
  get '/eolo-bookings', to: 'bookings#index_eolo'
  get '/barqa-bookings', to: 'bookings#index_barqa'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
