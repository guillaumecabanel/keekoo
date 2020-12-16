Rails.application.routes.draw do
  root to: 'home#show'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  get :wait_for_confirmation, to: 'pages#wait_for_confirmation'
end
