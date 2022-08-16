Rails.application.routes.draw do
 
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
 }
 
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }
 
 namespace :admin do
  root to: 'homes#top'
  resources :genres
  resources :items
  resources :customers
  resources :orders
 end
 
 scope module: :public do
  root to: 'homes#top'
  get 'about', to: 'homes#about'
  get 'customers/unsubscribe', to: 'customers#unsubscribe'
  patch 'customers/withdraw', to: 'customers#withdraw'
  get 'customers/mypage', to: 'customers#show', as: 'mypage'
  get 'customers/information/edit', to: 'customers#edit', as: 'edit_customers'
  patch 'customers/information', to: 'customers#update', as: 'update_customers'
  get 'orders/completed', to: 'orders#completed'
  post 'orders/confirm', to: 'orders#confirm'
  resources :orders
  resources :addresses
  resources :items, only: [:index, :show]
  delete 'cart_items/destroy_all', to: 'cart_items#destroy_all', as: 'destroy_all_cart_items'
  resources :cart_items
 end
end