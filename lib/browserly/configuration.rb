module Browserly
  class Configuration
    attr_accessor :tmp_path

    def initialize
      @tmp_path = '../../tmp/screenshots'
    end
  end
end
