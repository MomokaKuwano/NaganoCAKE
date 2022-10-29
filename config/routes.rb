Rails.application.routes.draw do
  
    devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  
   scope module: :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  scope module: :public do
    get 'orders/new'
    get 'orders/information'
    get 'orders/completed'
    get 'orders/index'
    get 'orders/show'
  end
  scope module: :public do
    get 'cart_items/index'
  end
  
  scope module: :public do
    resources :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe'
  end
  
  scope module: :public do
    get 'items/index'
    get 'items/show'
  end
  scope module: :public do
    get 'homes/top'
    get 'homes/about'
  end
  
  namespace :admin do
    get 'orders/show'
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    get 'homes/top'
  end

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
