# frozen_string_literal: true

module V1
  module Todo
    module Items
      class DestroyService < ApplicationCallable
        attr_reader :item

        def initialize(item)
          @item = item
        end

        def call
          @item.destroy!
            
          { success: true, payload: nil }
        rescue ActiveRecord::RecordNotFound => e
          { success: false, errors: { message: 'Item not found' }, status: :unprocessable_entity }
        end
      end
    end
  end
end