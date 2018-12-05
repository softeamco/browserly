# frozen_string_literal: true

module Browserly
  class Screenshot
    extend Comandor

    attr_reader :browser, :pool, :file, :selector

    def initialize(url, selector = '')
      @url = url
      @pool = Browserly::Pool.instance
      @browser = pool.take_browser
      @selector = selector
    end

    def perform
      take_screenshot! && release_browser!
    end

    private

    def take_screenshot!
      browser.navigate.to @url
      height = browser.execute_script(js) || 780
      browser.manage.window.resize_to(1280, height)
      @file = browser.save_screenshot(filename)
    end

    def release_browser!
      pool.release!(browser)
    end

    def js
      <<-JAVASCRIPT
        element = document.getElementById('#{selector}');

        if(element != null) {
          return element.clientHeight;
        } else {
          return null
        };
      JAVASCRIPT
    end

    def filename
      Rails.root.join('tmp', 'screenshots', "#{Time.now.to_i}.png")
    end
  end
end
