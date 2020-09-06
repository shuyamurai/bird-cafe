Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    names: 'users/names'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  root "items#index"
  resources :users, only: [:edit, :update]
  resources :items do
    resources :comments, only: :create
    # likesのパスをitemsの中に入れ子としてやることで、/item/1/likes/2のようなパスを作ることができる。
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end
