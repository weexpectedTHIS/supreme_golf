require './test/test_helper'

class SupremeGolfTest < Minitest::Test
  describe 'configure with x_api_key' do
    before do
      SupremeGolf.configure do |config|
        config.x_api_key = 'testkey'
      end
    end

    after do
      SupremeGolf.configure do |config|
        config.x_api_key = nil
      end
    end

    it 'should use x_api_key in request header' do
      Faraday.expects(:get).with("#{SupremeGolf::Course::API_URLS[:find]}/3002", {}, {'X-Api-Key' => 'testkey'}).returns(stub(body: {course: {}}.to_json))
      SupremeGolf::Course.find(3002)
    end
  end

  describe 'find' do
    it 'should make request with API_URLS :find and id' do
      Faraday.expects(:get).with("#{SupremeGolf::Course::API_URLS[:find]}/3002", {}, {}).returns(stub(body: {course: {}}.to_json))
      SupremeGolf::Course.find(3002)
    end
  end
end
