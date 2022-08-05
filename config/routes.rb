Rails.application.routes.draw do
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
 }
 
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }
 
 namespace :admin do
  resources :genres
  resources :items
  resources :customers
 end
end
