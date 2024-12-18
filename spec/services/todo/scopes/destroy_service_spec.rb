require 'rails_helper'

class V1::Todo::Scopes::DestroyServiceSpec < ActiveSupport::TestCase
  test 'destroy successful' do
    scope = create(:scope)
    service = V1::Todo::Scopes::DestroyService.new(scope)
    result = service.call

    assert result[:success]
    assert_equal result[:payload], scope
  end
end