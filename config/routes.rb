Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'archives/index'
  devise_for :users

  resources 'categories'
  resources 'entries'
  resources 'diet_plans'
  resources 'users', only: [:index]
  resources 'relationships', only: %i[index create destroy]
  root 'home#index'
  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?
end
