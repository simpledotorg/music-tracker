Rails.application.routes.draw do
  devise_for :users
  resources :albums do
    post :favorite, on: :member
    delete :unfavorite, on: :member
  end

  root to: "home#index"
end
