module SupremeGolf
  class Base
    def initialize attributes = {}
      (self.class::ATTRS.map(&:to_s) & attributes.keys).each do |attr|
        self.send("#{attr}=", attributes[attr])
      end
    end

    def self.response_from_api url, params = {}
      conn = Faraday.get url, params, SupremeGolf.configuration.http_headers
      JSON.parse(conn.body)
    end
  end
end
