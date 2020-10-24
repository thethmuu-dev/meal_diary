Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'archives/index'
  devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  resources 'categories'
  resources 'entries'
  resources 'users', only: [:index]
  resources 'relationships', only: %i[index create destroy]
  root 'entries#index'

end
