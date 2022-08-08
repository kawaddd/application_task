Rails.application.routes.draw do

  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/unsubscribe'
  end
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
  get 'homes/about'
  resources :customers
 end
end
