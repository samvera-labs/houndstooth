require "json_schemer"
require 'pathname'

@schema = Pathname.new('m3_json_schema.json')

puts "can't fine the file" unless File.exist?(ARGV[0])
exit unless File.exist?(ARGV[0])

@specification = YAML.load_file(ARGV[0])

def load_schema
  begin
    @schemer = JSONSchemer.schema(@schema)
    puts "Schema valid? true"
    true
  rescue => e
    puts e.message
    puts "Schema valid? false"
  end
end

def validate!
  puts "Specification valid? #{@schemer.valid?(@specification)}"
  @schemer.validate(@specification)
end

result = validate! if load_schema == true

result.to_a.each do | error |
  puts "Data: #{error['data']}"
  puts "Data pointer: #{error['data_pointer']}"
  puts "Schema: #{error['schema']}"
  puts "Schema pointer: #{error['schema_pointer']}"
  puts "Type: #{error['type']}"
  puts "\n"
end unless result.nil?