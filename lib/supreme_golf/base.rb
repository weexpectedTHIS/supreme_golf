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

    def self.find id
      response = self.response_from_api "#{self::API_URLS[:find]}/#{id}"
      key = self.name.split('::').last.to_s.gsub(/(.)([A-Z])/, '\1_\2').downcase

      raise 'RecordNotFound' unless response[key]
      new(response[key])
    end
  end
end
