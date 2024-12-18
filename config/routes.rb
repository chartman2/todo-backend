Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      namespace :todo do
        # Items
        get     'items',          to: 'items#index'
        post    'items',          to: 'items#create'
        put     'items/:item_id', to: 'items#update'
        delete  'items/:item_id', to: 'items#destroy'

        # Scopes
        get     'scopes',           to: 'scopes#index'
        post    'scopes',           to: 'scopes#create'
        put     'scopes/:scope_id', to: 'scopes#update'
        delete  'scopes/:scope_id', to: 'scopes#destroy'
      end
    end
  end
end
