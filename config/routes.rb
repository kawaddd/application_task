Rails.application.routes.draw do

 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
 }
 
 namespace :admin do
  root to: 'homes#top'
  resources :genres
  resources :items
  resources :customers
  resources :orders
 end
 
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }
 
 scope module: :public do
  root to: 'homes#top'
  get 'about', to: 'homes#about'
  resources :customers
  get 'customers/unsubscribe', to: 'customers#unsubscribe'
  resources :orders
  get 'orders/completed', to: 'orders#completed'
 end
end