module Api
  module V1
    class ItemsController < ApplicationController
      # force current_user to be authenticate
      before_action :authenticate_devise_api_token!

      def index
        @resource = { success: true, payload: current_devise_api_user.todo_items }

        serializer_response(::Todo::ItemSerializer)
      end

      def create
      end

      def update
      end

      def destroy
      end

      def item_params
        params.required(:item).permit(:name, :done)
      end
    end
  end
end