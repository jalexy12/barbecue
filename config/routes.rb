Rails.application.routes.draw do
  devise_for :users, :controller => { registrations: 'registrations' }
  root 'barbecues#index'

  resources :barbecues, only: [ :index, :show, :new, :create ]
  get 'api/barbecues/:id' => 'barbecues#showbbq'
  post 'api/barbecues/:id/join' => 'barbecues#join'
  	
end
