Rails.application.routes.draw do
  resources :transactions
  resources :accounts

  wash_out :wsbanks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
