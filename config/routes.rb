Rails.application.routes.draw do
  devise_for :users,  controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destinations'
    post 'destinations', to: 'users/registrations#create_destinations'
  end
  


  root 'items#index'
  get 'card/new'
  get 'card/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :items, only: [:index, :new, :show] do

    get "buy/confirmation", to: 'items#buy_confirmation'
  end

  get 'mypage/index', to: 'mypage#index'
  get 'logout/index', to: 'logout#index'

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

end
