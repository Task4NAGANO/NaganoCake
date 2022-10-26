Rails.application.routes.draw do
  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    get 'items' => 'items#index'
    get 'items/show'
  end


  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
