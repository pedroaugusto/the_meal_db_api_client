class TheMealDbApiClient::Configuration

  DEFAULT_DEVELOPMENT_API_KEY = 1

  attr_accessor :api_key

  # Allows user to change api configuration
  def initialize
    @api_key ||= DEFAULT_DEVELOPMENT_API_KEY
  end
end
