Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "products/manage_products", as: "manage_products"
  get "products/search", as: "search"
  get "products/sort", as: "sort"

  resources :categories
  resources :products
  root 'products#index'
end
