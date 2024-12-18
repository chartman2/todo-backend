# frozen_string_literal: true

module V1
  module Todo
    module Scopes
      class CreateService < ApplicationCallable
        attr_reader :properties

        def initialize(properties)
          @properties = properties
        end

        def call
          scope = ::Todo::Scope.new(@properties)

          scope.save!

          { success: true, payload: scope }
        rescue ActiveRecord::RecordInvalid => e
          { success: false, errors: e.record.errors.as_json, status: :unprocessable_entity }
        end
      end
    end
  end
end