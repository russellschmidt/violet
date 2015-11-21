Rails.application.routes.draw do

  get 'ratings/show'

  resources :labels, only: [:show]

  resources :advertisements, only: [:index, :show, :new, :create]
  resources :questions
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :welcome, only: [] do
    collection do
      get 'about'
      get 'contact'
      get 'faq'
    end
  end

  root to: 'welcome#index'

end
