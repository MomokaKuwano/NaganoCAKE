Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  
  namespace :admin do
    resources :genres
  end
  
  namespace :admin do
    get 'homes/top'
  end
  
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
    get 'customers/show'
    get 'customers/edit'
  end
  scope module: :public do
    get 'items/index'
    get 'items/show'
  end
  scope module: :public do
    get 'homes/top'
    get 'homes/about'
  end
  
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
