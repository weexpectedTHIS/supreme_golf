require './test/test_helper'

class SupremeGolfCourseTest < Minitest::Test
  describe 'setup' do
    it 'exist' do
      assert SupremeGolf::Course
    end
  end

  describe 'find' do
    it 'gives back expected info' do
      VCR.use_cassette('course_find') do
        course = SupremeGolf::Course.find(3002)
        assert_equal SupremeGolf::Course, course.class

        expected_values = {
          id: 3002,
          slug: "temecula-creek-inn-oaks-course-california",
          name: "Temecula Creek Inn - Oaks Course",
          description: "The 9-hole \"Oaks\" course at the Temecula Creek Inn facility in Temecula, California features 3,436 yards of golf from the longest tees for a par of 36. Designed by Ted Robinson, ASGCA, the Oaks golf course opened in 1969.",
          address_1: "44501 Rainbow Canyon Rd",
          address_2: nil,
          address_3: nil,
          address_city: "Temecula",
          address_state: "CA",
          address_zipcode: "92592-5988",
          address_country: "United States of America",
          phone: "855.685.9299",
          url: "http://www.temeculacreekinn.com/",
          time_zone: "America/Los_Angeles",
          latitude: 33.46898,
          longitude: -117.128529,
          rating: 3,
          rounded_rating: 3,
          rating_count: 3,
          rough_tee_time_count: 0,
          avg_rate: "22.0",
          avg_regular_rate: "22.0",
          min_rate: "22.0",
          min_regular_rate: "22.0",
          max_rate: "22.0",
          max_regular_rate: "22.0",
          course_url: "https://supremegolf.com/tee-times/at/temecula-creek-inn-oaks-course-california",
          course_reviews_url: "https://supremegolf.com/tee-times/at/temecula-creek-inn-oaks-course-california/reviews",
          photo_thumb_url: "https://supremegolf.s3.amazonaws.com/assets/courses/3002/thumb.jpg?1420237939",
          photo_medium_url: "https://supremegolf.s3.amazonaws.com/assets/courses/3002/medium.jpg?1420237939",
          photo_large_url: "https://supremegolf.s3.amazonaws.com/assets/courses/3002/large.jpg?1420237939"
        }
        expected_values.each do |attr, value|
          assert_equal value, course.send(attr), "#{attr} accesses value"
        end
      end
    end
  end

  describe 'near' do
    it 'gives back expected info' do
      VCR.use_cassette('courses_near') do
        courses = SupremeGolf::Course.near(params: {lat: 33.4677096, lon: -117.1318014})
        assert_equal SupremeGolf::Course, courses.first.class

        expected_values = {
          id: 3002,
          slug: "temecula-creek-inn-oaks-course-california",
          name: "Temecula Creek Inn - Oaks Course",
          description: "The 9-hole \"Oaks\" course at the Temecula Creek Inn facility in Temecula, California features 3,436 yards of golf from the longest tees for a par of 36. Designed by Ted Robinson, ASGCA, the Oaks golf course opened in 1969.",
          address_1: "44501 Rainbow Canyon Rd",
          address_2: nil,
          address_3: nil,
          address_city: "Temecula",
          address_state: "CA",
          address_zipcode: "92592-5988",
          address_country: "United States of America",
          phone: "855.685.9299",
          url: "http://www.temeculacreekinn.com/",
          time_zone: "America/Los_Angeles",
          latitude: 33.46898,
          longitude: -117.128529,
          rating: 3,
          rounded_rating: 3,
          rating_count: 3,
          rough_tee_time_count: 0,
          avg_rate: "22.0",
          avg_regular_rate: "22.0",
          min_rate: "22.0",
          min_regular_rate: "22.0",
          max_rate: "22.0",
          max_regular_rate: "22.0",
          distance: 0.208035786157303,
          course_url: "https://supremegolf.com/tee-times/at/temecula-creek-inn-oaks-course-california",
          course_reviews_url: "https://supremegolf.com/tee-times/at/temecula-creek-inn-oaks-course-california/reviews",
          photo_thumb_url: "https://supremegolf.s3.amazonaws.com/assets/courses/3002/thumb.jpg?1420237939",
          photo_medium_url: "https://supremegolf.s3.amazonaws.com/assets/courses/3002/medium.jpg?1420237939",
          photo_large_url: "https://supremegolf.s3.amazonaws.com/assets/courses/3002/large.jpg?1420237939"
        }
        expected_values.each do |attr, value|
          assert_equal value, courses.first.send(attr), "#{attr} accesses value"
        end
      end
    end
  end
end
