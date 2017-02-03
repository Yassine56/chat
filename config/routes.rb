Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :restore
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    collection do
      delete :empty_trash
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :mark_as_read
    end
  end

  resources :messages, only: [:new, :create]
  resources :chat_rooms


  get 'message/:id/up' => 'messages#up', as: 'up_message'
  get 'message/:id/down' => 'messages#down', as: 'down_message'
  root to: 'chat_rooms#index'
end
