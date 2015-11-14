Rails.application.routes.draw do

  resources :advertisements, only: [:index, :show, :new, :create]
  resources :posts, :questions

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'faq' => 'welcome#faq'

  root to: 'welcome#index'

end
