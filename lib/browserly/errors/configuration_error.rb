module Browserly
  class ConfigurationError < StandardError
    def message
      "Config failed: #{super}"
    end
  end
end
