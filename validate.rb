# frozen_string_literal: true

require 'json_schemer'
require 'pathname'

@schema = Pathname.new('m3_json_schema.json')

puts "can't fine the file" unless File.exist?(ARGV[0])
exit unless File.exist?(ARGV[0])

@specification = YAML.load_file(ARGV[0])

def load_schema
  @schemer = JSONSchemer.schema(@schema)
  puts 'Schema valid? true'
  true
rescue StandardError => e
  puts e.message
  puts 'Schema valid? false'
end

def validate!
  @schemer.validate(@specification)
end

def valid?
  valid = @schemer.valid?(@specification)
  puts "Specification valid? #{valid}"
  valid
end

if load_schema
  result = validate!
  result&.to_a&.each do |error|
    puts "Data: #{error['data']}"
    puts "Data pointer: #{error['data_pointer']}"
    puts "Schema: #{error['schema']}"
    puts "Schema pointer: #{error['schema_pointer']}"
    puts "Type: #{error['type']}"
    puts "\n"
  end
end

if valid?
  exit(true)
else
  exit(1)
end
