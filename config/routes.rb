Rails.application.routes.draw do
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "/" => "homes#top"
    resources :oders, only:[:show]
    resources :customers, only:[:index, :show, :edit]
    resources :genres, only:[:index, :edit]
    resources :items, only:[:index, :new, :show, :edit]
  end


  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    get "cart_items" => "cart_items#index"
    resources :items, only:[:index, :show]
    resources :customers, only:[:show, :edit, :quit, :update]
    resources :orders, only:[:new, :log, :thanx, :index, :show, :create]
    resources :address, only:[:index, :edit]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
