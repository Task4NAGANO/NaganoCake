Rails.application.routes.draw do
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "/" => "homes#top"
    resources :oders, only:[:show]
    resources :customers, only:[:index, :show, :edit]
    resources :genres, only:[:index, :edit, :create, :update]
    resources :items, only:[:index, :new, :show, :edit, :create, :update, :destroy]
  end


  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :cart_items do
      collection do
        delete 'destroy_all'
      end
    end
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :items, only:[:index, :show]
    resources :customers, only:[:show, :edit, :quit, :update]
    resources :orders, only:[:new, :confirm, :thanks, :index, :show, :create]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
