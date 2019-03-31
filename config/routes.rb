Rails.application.routes.draw do

  post 'users/:user_id/follow_user', to: 'relationships#follow_user', as: :follow_user
  post 'users/:user_id/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

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

  resources :users, only: %i[show edit]
  root 'links#index'
end
