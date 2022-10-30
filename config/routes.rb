Rails.application.routes.draw do
  namespace :admin do
    resource :oders, only:[:show]
    resource :customers, only:[:index, :show, :edit]
    resource :genres, only:[:index, :edit]
    resource :items, only:[:index, :new, :show, :edit]
    get 'homes/top'
  end

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    get "cart_items" => "art_items#index"
    resource :items, only:[:index, :show]
    resource :customers, only:[:show, :edit, :quit]
    resource :orders, only:[:new, :log, :thanx, :index, :show, :create]
    resource :address, only:[:index, :edit]
  end

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
