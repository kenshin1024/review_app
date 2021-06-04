Rails.application.routes.draw do
  devise_for :users
  root "artists#index"
  resources :artists, only: [:index, :create, :show, :edit, :destroy,:update] do
    resources :albums, only: [:show,:create, :edit] do
      resources :songs, only: [:show,:create]
    end
  end
end