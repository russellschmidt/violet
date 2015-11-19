Rails.application.routes.draw do

  resources :advertisements, only: [:index, :show, :new, :create]
  resources :questions do
    collection do
      get 'seek'
    end
    member do
      get 'asked'
    end
  end

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'faq' => 'welcome#faq'

  root to: 'welcome#index'

end
