Rails.application.routes.draw do
  root to: 'tribes#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  get :wait_for_confirmation, to: 'pages#wait_for_confirmation'

  resource :user_settings, only: :show
  resources :tribes, only: [:index, :show, :new, :create] do
    resources :moments, only: [:index, :create, :show]
  end

  resources :moments, only: [] do
    resources :comments, only: [:create]
  end

  resources :memberships, only: [:create]
  get :m, to: 'memberships#new'
end
