require './lib/supreme_golf'
require 'minitest/autorun'
require 'webmock/minitest'
require 'mocha/mini_test'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
end
