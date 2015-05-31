require 'faraday'
require 'json'

module SupremeGolf
  API_VERSION = 4
  API_BASE_URL = "https://supremegolf.com:443/api/v#{API_VERSION}"

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

  class Configuration
    attr_accessor :x_api_key

    def initialize
      @x_api_key = nil
    end

    def http_headers
      headers = {}
      headers['X-Api-Key'] = @x_api_key if @x_api_key
      headers
    end
  end

  configure
end

require 'supreme_golf/base'
require 'supreme_golf/version'
require 'supreme_golf/course'
require 'supreme_golf/tee_time'
