Rails.application.routes.draw do

      devise_for :admins,path:'admin', controllers: {
      sessions: 'admin/sessions',
      registrations: 'admin/registrations',
      passwords: 'admin/passwords'
    }

      devise_for :members, controllers: {
      sessions: 'member/sessions',
      registrations: 'member/registrations',
      passwords: 'member/passwords'
    }

  root to: "member/products#top"

  namespace :admin do
  	resources :orders, only: [:index,:show,:update]
    resources :order_details, only: [:update]
    resources :members, only: [:index,:show,:edit,:update]
    resources :genres, only: [:index,:edit,:update,:create]
    resources :products, except: [:destroy]
    get '/' => "admin#top"
  end

  namespace :member,path:'' do
  	resource :members, only: [:show,:edit,:update]
  	get '/members/unsubscribe' => 'members#unsubscribe'
  	patch '/members/withdraw' => 'members#withdraw'
  	resources :shipping_addresses, except: [:show,:new]
    resources :orders, only: [:show,:edit,:new,:create]
    get 'orders/complete' => 'orders#complete'
    resources :cart_products, only: [:index,:update,:create,:destroy]
    delete 'cart_products/destroy_all'
    resources :products, only: [:index,:show]
    get 'products/top' => 'products#top'
    get '/products/about' => 'products#about'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
