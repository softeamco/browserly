# Browserly
Is a simple tool that helps to create website screenshots using selenium + chrome driver. This gem creates pool of browsers thus increases speed of taking webpage screenshot.

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
  config.tmp_path = 'path/to/store/screenshots'
  config.pool_size = 1 # count of browsers instance to start
end
```

## Usage

```ruby
screenshot = Browserly::Screenshot.new('http://example.com').perform
screenshot.file #=> screenshot image file
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
