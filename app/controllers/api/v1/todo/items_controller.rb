module Api
  module V1
    module Todo
      class ItemsController < ApplicationController
        # force current_user to be authenticate
        before_action :authenticate_devise_api_token!
        # get item only for update and destroy actions
        before_action :set_item, only: %i[update destroy]
        # get scope only for create and update actions
        before_action :set_scope, only: %i[create update]
        
        def index
          @resource = { success: true, payload: current_devise_api_user.todo_items }

          serializer_response(::Todo::ItemSerializer)
        end

        def create
          @resource = ::V1::Todo::Items::CreateService.call(current_devise_api_user, @scope, item_params)

          serializer_response(::Todo::ItemSerializer)
        end

        def update
          @resource = ::V1::Todo::Items::UpdateService.call(current_devise_api_user, @item, @scope, item_params)

          serializer_response(::Todo::ItemSerializer)
        end

        def destroy
          @resource = ::V1::Todo::Items::DestroyService.call(@item)

          serializer_response(::Todo::ItemSerializer)
        end

        def set_item
          @item = ::Todo::Item.find(params[:item_id])
        rescue ActiveRecord::RecordNotFound => _e
          { success: false, errors: 'model.notFound' }
        end

        def set_scope
          @scope = ::Todo::Scope.find(item_params[:scope_id])
        rescue ActiveRecord::RecordNotFound => _e
          { success: false, errors: 'model.notFound' }
        end

        def item_params
          params.required(:item).permit(:id, :name, :done, :scope_id)
        end
      end
    end
  end
end