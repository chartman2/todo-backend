# frozen_string_literal: true

module V1
  module Todo
    module Items
      # Create a Todo item with the specified properties.
      #
      # user       - The owner of the item
      # properties - A Hash of attributes to set on the new item. The allowed keys are:
      #             - name        - The name of the item
      #             - done        - Whether the item is completed or not
      #
      # Returns a hash containing a success flag and the newly created Todo::Item object if the record was saved successfully,
      # or an error hash with validation errors if creation failed.
      class CreateService < ApplicationCallable
        attr_reader :user, :scope, :properties

        def initialize(user, scope, properties)
          @user       = user
          @scope      = scope
          @properties = properties
        end

        def call
          item = ::Todo::Item.create! @properties.merge({ user: @user, scope: @scope })

          { success: true, payload: item }
        rescue ActiveRecord::RecordInvalid => e
          { success: false, errors: e.record.errors.as_json, status: :unprocessable_entity }
        end
      end
    end
  end
end