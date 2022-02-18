Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
