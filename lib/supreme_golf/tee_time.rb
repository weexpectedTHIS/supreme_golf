module SupremeGolf
  class TeeTime < SupremeGolf::Base
    AT_URL = "#{SupremeGolf::API_BASE_URL}/tee_times/at"
    VALID_URL = "#{SupremeGolf::API_BASE_URL}/tee_times"

    ATTRS = [:id,
      :course_id,
      :currency,
      :players,
      :rate,
      :regular_rate,
      :savings_pct,
      :savings_amount,
      :tee_off_at_formatted,
      :tee_off_at_iso8601,
      :amenities,
      :provider
    ]
    attr_accessor *ATTRS

    def self.at course_id, params: {}
      response = self.response_from_api "#{AT_URL}/#{course_id}", params

      response['tee_times'].map do |tee_time_params|
        new(tee_time_params)
      end
    end

    def self.valid id, params: {}
      response = self.response_from_api "#{VALID_URL}/#{id}/valid", params

      response['reservation_url']
    end
  end
end
