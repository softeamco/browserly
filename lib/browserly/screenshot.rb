# frozen_string_literal: true

module Browserly
  class Screenshot
    extend Comandor
    attr_reader :file

    def initialize(url, height_selector = '')
      @url = url
      @height_selector = height_selector
    end

    def perform
      take! && close_session!
    end

    def driver
      @driver ||= Browserly::Driver.new(Browserly.configuration.remote_driver, Browserly.configuration.chrome_args).driver
    end

    private

    def take!
      driver.navigate.to @url
      @height = driver.execute_script(js) unless @height_selector.nil? || @height_selector == ''
      @height ||= Browserly.configuration.height
      driver.manage.window.resize_to(Browserly.configuration.width, @height)
      @file = driver.save_screenshot(filename)&.path
      return true if File.exist?(@file)
      error(:file, 'Unable to save file')
      false
    end

    def close_session!
      return true if driver.close && driver.quit
    rescue => e
      error(:session, e.message)
      false
    end

    def js
      <<-JAVASCRIPT
        element = document.getElementById('#{@height_selector}');

        if(element != null) {
          return element.clientHeight;
        } else {
          return null
        };
      JAVASCRIPT
    end

    def filename
      File.join(Browserly.configuration.output_dir, "#{Time.now.to_i}.png")
    end
  end
end
