Rails.application.routes.draw do
  root to: "public/homes#top"
  # 管理者側のルーティング
  get "/admin" => "admin/homes#top"
  namespace :admin do
    resources :customers,only:[:index,:show,:edit,:update]
  end
  namespace :admin do
    resources :genres,only:[:index,:create,:edit,:update]
  end
  namespace :admin do
    resources :items,only:[:index,:new,:create,:show,:edit,:update]
  end
  namespace :admin do
    resources :order_details,only:[:update]
  end
  namespace :admin do
    resources :orders,only:[:show,:update]
  end

# 会員側ルーティング
# homes
  get "/" => "public/homes#top"
  get "/about" => "public/homes#about"

  # items
  get "/items" => "public/items#index"
  get "/items/#{:id}" => "public/items#show"

  # customers
  get "/customers/my_page" => "public/customers#show"
  get "/customers/edit" => "public/customers#edit"
  patch "/customers/edit"=> "public/customers#update"
  get "/customers/unsubscribe" => "public/customers#unsubscribe"
  patch "/customers/withdraw" => "public/customers#withdraw"

  # cart_items
  resources :cart_items,only:[:index,:update,:destroy,:create]
  delete "/cart_items/destroy_all" => "cart_items#destroy_all"

  # orders
  get "/orders/new" => "public/orders#new"
  post "/orders" => "public/orders#create"
  get "/orders#{:id}" => "public/orders#show"
  get "/orders" => "public/orders#index"
  get "/orders/complete" => "orders#complete"
  post "/orders/confirm" => "orders#confirm"

  # addresses
  get "/addresses" => "public/addresses#index"
  get "/addresses/#{:id}/edit" => "public/addresses#edit"
  post "/addresses/" => "public/addresses#create"
  patch "/addresses/#{:id}" => "public/addresses#update"
  delete "/addresses/#{:id}" => "public/addresses#destroy"
  # デバイス
  devise_for :customers,skip:[:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  devise_for :admin,skip:[:registrations,:passwords],controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end