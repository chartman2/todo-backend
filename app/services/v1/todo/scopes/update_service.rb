module V1
  module Todo
    module Scopes
      class UpdateService < ApplicationCallable
        attr_reader :scope, :properties
  
        def initialize(scope, properties)
          @scope = scope
          @properties = properties
        end
  
        def call
          ActiveRecord::Base.transaction do
            @scope.update!(properties)
            { success: true, payload: scope }
          rescue ActiveRecord::RecordNotFound => e
            { success: false, errors: e.record.errors.as_json, status: :unprocessable_entity }
          rescue ActiveRecord::StatementInvalid => e
            { success: false, errors: e.record.errors.as_json, status: :unprocessable_entity }
          end
        end
      end
    end
  end
end