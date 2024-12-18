module V1
  module Todo
    module Scopes
      class DestroyService < ApplicationCallable
        attr_reader :scope

        def initialize(scope)
          @scope = scope
        end

        def call
          @scope.destroy!
            
          { success: true, payload: nil }
        rescue ActiveRecord::RecordNotFound => e
          { success: false, errors: { message: 'Scope not found' }, status: :unprocessable_entity }
        end
      end
    end
  end
end