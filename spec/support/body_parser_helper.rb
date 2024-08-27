# frozen_string_literal: true

module BodyParserHelper
  def parsed_body
    JSON.parse(response.body, {symbolize_names: true})
  end
end
  
RSpec.configuration.include BodyParserHelper, type: :request