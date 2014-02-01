EmberWebsocket::Application.routes.draw do
  resources :chats
  root 'ember#index'
  namespace :api do
    namespace :v1 do
      resources :chats,
                only: [:index, :show, :create, :update, :destroy],
                defaults: { format: 'json' }
    end
  end
end

