module SupremeGolf
  class Course < SupremeGolf::Base
    FIND_URL = "#{SupremeGolf::API_BASE_URL}/courses"
    NEAR_URL = "#{SupremeGolf::API_BASE_URL}/courses/near"

    ATTRS = [:id,
      :slug,
      :name,
      :description,
      :address_1,
      :address_2,
      :address_3,
      :address_city,
      :address_state,
      :address_zipcode,
      :address_country,
      :phone,
      :url,
      :time_zone,
      :latitude,
      :longitude,
      :rating,
      :rounded_rating,
      :rating_count,
      :rough_tee_time_count,
      :avg_rate,
      :avg_regular_rate,
      :min_rate,
      :min_regular_rate,
      :max_rate,
      :max_regular_rate,
      :distance,
      :course_url,
      :course_reviews_url,
      :photo_thumb_url,
      :photo_medium_url,
      :photo_large_url
    ]
    attr_accessor *ATTRS

    def self.find id
      response = self.response_from_api "#{FIND_URL}/#{id}"

      raise 'RecordNotFound' unless response['course']
      new(response['course'])
    end

    def self.near params: {}
      response = self.response_from_api NEAR_URL, params

      response['courses'].map do |course_params|
        new(course_params)
      end
    end
  end
end
