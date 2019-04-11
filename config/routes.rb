Rails.application.routes.draw do

  resources :majors
  resources :requirements
  root to: 'home#index'

  # User
  get 'user/:id', to: 'user#show', as: :user
  devise_for :users

  # custom signin, signout, and signup routes for devise
  devise_scope :user do
    get 'signin', to: 'devise/sessions#new'
    get 'signout', to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new'
  end

  # Courses
  resources :courses

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
