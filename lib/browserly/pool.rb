# frozen_string_literal: true

module Browserly
  class Pool
    include ::Singleton
    attr_reader :browsers

    def initialize
      @browsers = SizedQueue.new(Browserly.configuration.pool_size)
      Browserly.configuration.pool_size.times { @browsers.push(new_browser) }
    end

    def take_browser
      @browsers.pop
    end

    def release!(browser)
      @browsers.push(browser)
    end

    def terminate_all!
      @browsers.each(&:quit)
    end

    private

    def new_browser
      options = Selenium::WebDriver::Chrome::Options.new(
        args: [
          '--headless',
          '--hide-scrollbars',
          '--ignore-certificate-errors',
          '--disable-popup-blocking',
          '--disable-translate',
          '--window-size=1280,780',
          '--enable-font-antialiasing',
          '--font-cache-shared-handle[6]'
        ]
      )
      Selenium::WebDriver.for :chrome, options: options
    end
  end
end
