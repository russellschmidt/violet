Rails.application.routes.draw do

  resources :advertisements, only: [:index, :show, :new, :create]
  resources :questions
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :welcome, only: [] do
    get 'about'
    get 'contact'
    get 'faq'
  end

  root to: 'welcome#index'
end
