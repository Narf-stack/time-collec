Rails.application.routes.draw do
  root to: 'shops#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :shops, only: :show, param: :slug
  resources :shops, only: :index

end
