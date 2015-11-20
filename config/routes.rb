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

  resources :users, only: [:new, :create] do
    collection do
      post 'confirm'
    end
  end
  #post 'users/confirm' => 'users#confirm'

  resources :welcome, only: [] do
    #collection do
      get 'about'
      get 'contact'
      get 'faq'
    #end
  end

  #get 'about' => 'welcome#about'
  #get 'contact' => 'welcome#contact'
  #get 'faq' => 'welcome#faq'

  root to: 'welcome#index'

end
