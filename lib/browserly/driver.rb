module Browserly
  class Driver
    attr_reader :chrome_args, :driver

    def initialize(remote, chrome_args)
      @remote = remote
      @chrome_args = chrome_args

      return remote_driver if remote
      local_driver
    end

    private

    def local_driver
      @driver = Selenium::WebDriver.for :chrome, options: options
    end

    def remote_driver
      raise ConfigurationError, :remote_driver_url unless Browserly.configuration.remote_driver_url

      caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => options)

      @driver = Selenium::WebDriver.for :remote,
                              url: Browserly.configuration.remote_driver_url,
                              desired_capabilities: caps
    end

    def options
      { args: chrome_args }
    end
  end
end
