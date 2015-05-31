require './test/test_helper'

class SupremeGolfTeeTimeTest < Minitest::Test
  describe 'setup' do
    it 'exist' do
      assert SupremeGolf::TeeTime
    end
  end

  describe 'at' do
    it 'gives back expected info' do
      VCR.use_cassette('tee_time_at') do
        tee_times = SupremeGolf::TeeTime.at 3003, params: {date: '2015-05-31'}
        assert_equal SupremeGolf::TeeTime, tee_times.first.class

        expected_values = {
          id: 365267167,
          course_id: 3003,
          currency: "USD",
          players: [
            1,
            2,
            3,
            4
          ],
          rate: "62.00",
          regular_rate: "100.00",
          savings_pct: 38,
          savings_amount: "38.00",
          tee_off_at_formatted: "6:10AM",
          tee_off_at_iso8601: "2015-05-31T06:10:00Z",
          amenities: [
            "is_18_holes",
            "is_riding",
            "is_earlybird"
          ],
          provider: {
            "code" => "golf_now",
            "name" =>  "GolfNow"
          }
        }
        expected_values.each do |attr, value|
          assert_equal value, tee_times.first.send(attr), "#{attr} accesses value"
        end
      end
    end
  end

  describe 'valid' do
    it 'returns reservation url' do
      VCR.use_cassette('tee_time_valid') do
        reservation_url = SupremeGolf::TeeTime.valid '352638828', params: {qty: 2}

        assert_equal 'https://supremegolf.com/tee-times/book-it/golf18_network/the-golf-club-of-california-california/may-31/2/352638828', reservation_url
      end
    end

    describe 'invalid id' do
      it 'returns nil reservation url' do
        VCR.use_cassette('tee_time_invalid') do
          reservation_url = SupremeGolf::TeeTime.valid '00000000', params: {qty: 2}

          assert_equal nil, reservation_url
        end
      end
    end
  end
end
