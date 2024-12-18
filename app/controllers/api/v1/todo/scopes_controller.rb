module Api
  module V1
    module Todo
      class ScopesController < ApplicationController
        # force current_user to be authenticate
        before_action :authenticate_devise_api_token!
        # get scope only for update and destroy actions
        before_action :set_scope, only: %i[update destroy]
        
        def index
          @resource = { success: true, payload: ::Todo::Scope.all }

          serializer_response(::Todo::ScopeSerializer)
        end

        def create
          @resource = ::V1::Todo::Scopes::CreateService.call(scope_params)

          serializer_response(::Todo::ScopeSerializer)
        end

        def update
          @resource = ::V1::Todo::Scopes::UpdateService.call(@scope, scope_params)

          serializer_response(::Todo::ScopeSerializer)
        end

        def destroy
          @resource = ::V1::Todo::Scopes::DestroyService.call(@scope)

          serializer_response(::Todo::ScopeSerializer)
        end

        def set_scope
          @scope = ::Todo::Scope.find(params[:scope_id])
        rescue ActiveRecord::RecordNotFound => _e
          { success: false, errors: 'model.notFound' }
        end

        def scope_params
          params.required(:scope).permit(:id, :name, :nickname)
        end
      end
    end
  end
end