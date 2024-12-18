require 'rails_helper'

class V1::Todo::Scopes::CreateServiceSpec < ActiveSupport::TestCase
  test 'should create a new scope' do
    properties = { name: 'New Scope' }
    service = V1::Todo::Scopes::CreateService.new(properties)

    result = service.call

    assert result[:success]
    assert_equal properties[:name], result[:payload][:name]
  end

  test 'should return errors when ActiveRecord raises an exception' do
    properties = { name: nil }
    service = V1::Todo::Scopes::CreateService.new(properties)

    result = service.call

    assert !result[:success]
    assert_not_nil result[:errors]
    assert_equal :unprocessable_entity, result[:status]
  end
end