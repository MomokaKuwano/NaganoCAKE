Rails.application.routes.draw do

    devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  scope module: :public do
    root to:'homes#top'
    get 'homes/about'
    resources :customers, only: [:show, :edit, :update]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    post 'orders/information' => 'orders#information'
    get 'orders/completed' => 'orders#completed'
    delete '/cart_items/:id/destroy_all' =>'cart_items#destroy_all', as: 'destroy_all'
    resources :orders, only: [:new, :create, :index, :show]
    resources :items, only: [:index, :show]
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'
  end

  namespace :admin do
    root to:'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
