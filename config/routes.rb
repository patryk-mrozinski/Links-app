Rails.application.routes.draw do
  devise_for :users

  resources :links do
    member do
      put 'like', to: 'links#like'
      put 'dislike', to: 'links#dislike'
    end
  end

  resources :comments do
    member do
      put 'like', to: 'comments#like'
      put 'dislike', to: 'comments#dislike'
    end
  end

  resources :tags, only: [:show]

  root 'links#index'
end
