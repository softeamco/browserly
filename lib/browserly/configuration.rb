module Browserly
  class Configuration
    attr_accessor :tmp_path, :pool_size

    def initialize
      @tmp_path = '../../tmp/screenshots'
      @pool_size = 1
    end
  end
end
