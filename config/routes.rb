Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :guitars
  # root 'welcome#index'
  root 'guitars#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
