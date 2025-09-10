Rails.application.routes.draw do
  get "cart_items/create"
  get "cart_items/destroy"
  namespace :api do
    namespace :v1 do
      resources :carts, only: [:show] do
        resources :cart_items, only: [:create, :destroy]
      end
    end
  end
end
