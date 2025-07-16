# Houndstooth

A meta-model based on [Scooby
Snacks](https://github.com/UCSCLibrary/ScoobySnacks) and [Dog
Biscuits](https://github.com/samvera-labs/dog_biscuits)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'houndstooth'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install houndstooth

## Usage

### Command-Line

To validate an M3 YAML file, you can use the provided executable:

```bash
$ houndstooth path/to/your/m3_file.yml
```

### Library

You can also use the `Houndstooth::Validator` class in your own Ruby code:

```ruby
require 'houndstooth'

validator = Houndstooth::Validator.new('path/to/your/m3_file.yml')

if validator.valid?
  puts "The file is valid!"
else
  puts "Validation errors:"
  validator.validate.each do |error|
    puts "- #{error['data_pointer']}: #{error['type']}"
  end
end
```

## Tools

* yamllint (`gem install yamllint`) - command line YAML validation
* [jsonschemalint](https://jsonschemalint.com/#/version/draft-07/markup/json) - web-based tool for validating json against a JSON schema
* [YAML Converter](https://codebeautify.org/yaml-to-json-xml-csv) - web-based tool for converting YAML to JSON

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake test` to run the RSpec tests and `yamllint` on the example files. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `lib/houndstooth/version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [RubyGems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/samvera-labs/houndstooth. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) file.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
