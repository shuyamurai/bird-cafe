Rails.application.routes.draw do
  devise_for :users
  
  root "items#index"
  resources :users, only: [:edit, :update]
  resources :items do
    resources :comments, only: :create
    # likesのパスをitemsの中に入れ子としてやることで、/item/1/likes/2のようなパスを作ることができる。
    resources :likes, only: [:create, :destroy]
  end
end
