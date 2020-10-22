Rails.application.routes.draw do
  get 'archives/index'
  devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  resources 'categories'
  resources 'entries'
  root 'entries#index'

end
