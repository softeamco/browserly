module Browserly
  class Configuration
    attr_accessor :output_dir,
                  :width,
                  :height,
                  :remote_driver,
                  :remote_driver_url,
                  :chrome_args

    def initialize
      @output_dir = File.join(Dir.tmpdir, 'siter_screenshots')

      unless File.directory?(@output_dir)
        FileUtils.mkdir_p(@output_dir)
      end

      @width = 1280
      @height = 780
      @remote_driver = true
      @remote_driver_url = "http://localhost:4444/wd/hub"
      @chrome_args = [
        '--headless',
        '--hide-scrollbars',
        '--ignore-certificate-errors',
        '--disable-popup-blocking',
        '--disable-translate',
        "--window-size=#{@width},#{@height}",
        '--enable-font-antialiasing',
        '--font-cache-shared-handle[6]'
      ]
    end
  end
end
