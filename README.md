# SupremeGolf

## Installation

Add this line to your application's Gemfile:

    gem 'supreme_golf'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install supreme_golf

## Official docs

    https://supremegolf.com/api/docs/

## Configuration

    SupremeGolf.configure do |config|
      config.x_api_key = 'your-api-key-here'
    end

## Usage

The "params" passed to the API methods are simply the parameters defined in the official documentation listed above.

    # Get all courses near a lat/lon
    SupremeGolf::Course.near(params: {lat: 33.4677096, lon: -117.1318014, limit: 1})

    # Get one course from an id
    SupremeGolf::Course.find(3003)

    # Get tee times for a course_id
    SupremeGolf::TeeTime.at(3003)

    # Get reservation url for a specific tee time for 2 people. Returning nil means invalid, returning string is reservation url
    SupremeGolf::TeeTime.valid(30923902, params: {qty: 2})


## Contributing

You're welcome to contribute and help flesh out the rest of the API. I only implemented the methods I needed for my specific case, but there are many more you can see from the official docs.

1. Fork it ( https://github.com/[my-github-username]/supreme_golf/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
