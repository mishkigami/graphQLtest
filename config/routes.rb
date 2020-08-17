Rails.application.routes.draw do
  scope module: :web do
    root to: 'welcome#index'
      resources :products, only: [:index]
      namespace :admin do
        resource :session, only: [:new, :create, :destroy]
        resources :products
      end    
  end
end
