Rails.application.routes.draw do
  root to: 'shops#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :shops, only: :show, param: :slug do 
    resources :emergencies, controller: :contacts, type:'Emergency', only: [:new,:create,:edit,:update,:destroy ]
    resources :friends, controller: :contacts, type:'Friend'
  end
  resources :shops, only: :index
  post "new_contact", to: "shops#new_contact", as: "new_contact"

end
