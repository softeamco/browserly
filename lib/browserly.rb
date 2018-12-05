require 'singleton'
require 'comandor'
require 'selenium-webdriver'
require 'browserly/configuration'
require 'browserly/pool'
require 'browserly/screenshot'
require 'browserly/version'

module Browserly
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
