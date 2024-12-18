
module V1
  module Todo
    module Items
      class UpdateService < ApplicationCallable
        attr_reader :user, :item, :scope, :properties

        def initialize(user, item, scope, properties)
          @user       = user
          @item       = item
          @scope      = scope
          @properties = properties
        end

        def call
          @item.update! @properties.merge({ user: @user, scope: @scope })

          { success: true, payload: @item }
        rescue ActiveRecord::RecordInvalid => e
          { success: false, errors: e.record.errors.as_json, status: :unprocessable_entity }
        end
      end
    end
  end
end