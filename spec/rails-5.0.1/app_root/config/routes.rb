Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "texts#index"

  resources :cakes do
    get "custom_action", on: :member
  end

  resources :colors, only: :show
  resources :dashboards, only: :show
  resources :risks, only: :show
  resources :songs, only: [:show, :update]
  resources :users, only: [:show, :update]

  get ':controller(/:action(/:id(.:format)))'
end
