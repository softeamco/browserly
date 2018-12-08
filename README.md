# Browserly
Is a simple tool that helps to create website screenshots using selenium + chrome driver. It also can work with remote selenium webdriver.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'browserly'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install browserly
```

## Configuration

```ruby
Browserly.configure do |config|
  config.output_dir = Rails.root.join('tmp', 'screenshots')
  config.width = 1280
  config.height = 780
  config.remote_driver = true # default
  config.remote_driver_url = "http://localhost:4444/wd/hub"
  config.chrome_args = [
    '--headless',
    '--hide-scrollbars',
    '--ignore-certificate-errors',
    '--disable-popup-blocking',
    '--disable-translate',
    "--window-size=#{config.width},#{config.height}",
    '--enable-font-antialiasing',
    '--font-cache-shared-handle[6]'
  ]
end
```

## Usage

```ruby
screenshot = Browserly::Screenshot.new('http://example.com').perform
screenshot.file #=> screenshot image file
```

Also you can pass DOM ID as second parameter to get it height on the page. This height will be used as screenshot height.

```ruby
screenshot = Browserly::Screenshot.new('http://example.com', 'DOM_ID').perform
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to rubygems.org.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/softeamco/browserly. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
