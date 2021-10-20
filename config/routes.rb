Rails.application.routes.draw do

  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/create'
    get 'orders/thanks'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
  namespace :public do
    get 'cart_itemsindex/create'
    get 'cart_itemsindex/update'
    get 'cart_itemsindex/destroy'
    get 'cart_itemsindex/destroy_all'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/update'
    get 'addresses/create'
    get 'addresses/destroy'
  end
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'order_items/update'
  end
  get 'order_items/update'
  namespace :admin do
    get 'items/new'
    get 'items/create'
    get 'items/index'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  # public
  devise_for :public,skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root 'public/homes#top'

   namespace :public do

    get 'public/homes/about',to: "homes#about"

    resources :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe'
    get 'customers/withdraw'

    resources :addresses, only: [:index, :edit, :update, :create, :destroy]

    resources :items, only: [:index, :show]

    resources :cart_items, only: [:index, :update, :destroy, :create]
    put :cart_items, to: 'cart_items#destroy_all'

    resources :orders, only: [:new, :create, :index, :show]
    get 'orders/confirm'
    get 'orders/thanks'

  end

  # admin
  devise_for :admin, skip: [:passwords] ,controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top'

    resources :customers, only: [:index, :show, :edit, :update]

    resources :items, only: [:new, :create, :index, :show, :edit, :update]

    resources :categories, only: [:create, :index, :edit, :update]

    resources :orders, only: [:show, :update]

    resources :order_items, only: [:update]

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
