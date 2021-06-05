Rails.application.routes.draw do
  devise_for :users
  root "artists#index"
  resources :artists, only: [:index, :create, :show, :edit, :destroy,:update] do
    resources :albums, only: [:show,:create, :edit, :destroy,:update] do
      resources :songs, only: [:show,:create,:edit,:update,:destroy]
    end
  end
end