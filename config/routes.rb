# frozen_string_literal: true
Rails.application.routes.draw do
  resources :loans, only: [:create, :update, :destroy]
  resources :borrowers, except: [:new, :edit]
  resources :authors, except: [:new, :edit]
  resources :books, except: [:new, :edit]

  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
end
