Rails.application.routes.draw do
  # 管理者側のルーティング
  get "/admin" => "admin/homes#top",as: "admin_root"
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
  root to: "public/homes#top"
# homes
  # get "/" => "public/homes#top"
  get "/about" => "public/homes#about"

  # items
  get "/items" => "public/items#index"
  get "/items/:id" => "public/items#show",as: "item"

  # customers
  get "/customers/my_page" => "public/customers#show"
  get "/customers/edit" => "public/customers#edit"
  patch "/customers/edit"=> "public/customers#update"
  get "/customers/unsubscribe" => "public/customers#unsubscribe"
  patch "/customers/withdraw" => "public/customers#withdraw"

  # cart_items
  get "/cart_items/" => "public/cart_items#index"
  post "/cart_items" => "public/cart_items#create"
  patch "/cart_items/:id" => "public/cart_items#update",as: "update_cart"
  delete "/cart_items/destroy_all" => "public/cart_items#destroy_all",as: "delete_all"
  delete "/cart_items/:id" => "public/cart_items#destroy",as: "delete_cart_item"

  # orders
  get "/orders/new" => "public/orders#new"
  post "/orders" => "public/orders#create"
  get "/orders/complete" => "public/orders#complete"
  post "/orders/confirm" => "public/orders#confirm",as: "confirm_order"
  get "/orders/:id" => "public/orders#show"
  get "/orders" => "public/orders#index"

  # addresses
  get "/addresses" => "public/addresses#index"
  get "/addresses/:id/edit" => "public/addresses#edit",as: "edit_address"
  post "/addresses" => "public/addresses#create",as: "create_address"
  patch "/addresses/:id" => "public/addresses#update",as: "update_address"
  delete "/addresses/:id" => "public/addresses#destroy",as: "destroy_addresses"
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