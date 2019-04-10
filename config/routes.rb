Rails.application.routes.draw do

  devise_for :users

  # custom signin, signout, and signup routes for devise
  devise_scope :user do
    get 'signin', to: 'devise/sessions#new'
    get 'signout', to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new'
  end

  root to: 'home#index'

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
