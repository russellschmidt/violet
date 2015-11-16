Rails.application.routes.draw do

  resources :advertisements, only: [:index, :show, :new, :create]
  resources :questions
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'faq' => 'welcome#faq'

  root to: 'welcome#index'

end
