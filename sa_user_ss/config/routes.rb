Rails.application.routes.draw do
  resources :users

  wash_out :wsusers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
