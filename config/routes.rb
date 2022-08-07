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
end
