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
  get "/customers/my_page" => "customers#show"
  get "/customers/edit" => "customers#edit"
  patch "/customers"=> "customers#update"
  get "/customers/unsubscribe" => "customers#unsubscribe"
  patch "/customers/withdraw" => "customers#withdraw"

  # cart_items
  resources :cart_items,only:[:index,:update,:destroy,:create]
  delete "/cart_items/destroy_all" => "cart_items#destroy_all"

  # orders
  resources :orders,only:[:new,:create,:index,:show]
  get "/orders/complete" => "orders#complete"
  post "/orders/confirm" => "orders#confirm"

  # addresses
  resources :addresses,only:[:index,:edit,:create,:update,:destroy]

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