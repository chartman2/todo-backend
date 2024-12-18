require 'rails_helper'

class V1::Todo::Scopes::UpdateServiceSpec < ActiveSupport::TestCase
  test 'updates an existing scope with valid properties' do
    scope = create(:scope)
    properties = { name: 'Updated Scope' }

    service = UpdateService.new(scope, properties)
    result = service.call

    assert result[:success]
    assert_equal result[:payload][:name], properties[:name]
  end

  test 'raises an error for an non-existent scope' do
    properties = { name: 'New Scope' }

    service = UpdateService.new(nil, properties)
    result = service.call

    assert !result[:success]
    assert_equal result[:status], :unprocessable_entity
  end

  test 'raises an error for invalid properties' do
    scope = create(:scope)
    properties = { name: nil }

    service = UpdateService.new(scope, properties)
    result = service.call

    assert !result[:success]
    assert_equal result[:status], :unprocessable_entity
  end
end