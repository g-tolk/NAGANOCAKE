Rails.application.routes.draw do

  devise_for :admins
  devise_for :members

  get '/members/about' => 'members#about'

  get '/members/unsubscribe' => 'members#unsubscribe'


  root to: "members#top"
  namespace :admins do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admins do
    get 'members/index'
    get 'members/show'
    get 'members/edit'
  end
  namespace :admins do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admins do
    get 'products/new'
    get 'products/index'
    get 'products/edit'
    get 'products/show'
  end
  namespace :admins do
    get '/' => "admins#top"
  end
  namespace :members do
    get 'shipping_addresses/index'
    get 'shipping_addresses/edit'
  end
  namespace :members do
    get 'orders/new'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :members do
    get 'cart_products/index'
  end
  namespace :members do
    get 'members/show'
    get 'members/unsubscribe'
    get 'members/edit'
  end
  namespace :members do
    get 'products/top'
    get 'products/index'
    get 'products/show'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
