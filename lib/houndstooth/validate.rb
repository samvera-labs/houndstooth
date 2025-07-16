# frozen_string_literal: true

require 'json_schemer'
require 'pathname'
require 'yaml'

module Houndstooth
  class Validator
    SCHEMA_PATH = Pathname.new(File.expand_path('data/m3_json_schema.json', __dir__))

    def initialize(file_path)
      raise "File not found: #{file_path}" unless File.exist?(file_path)
      @file_path = file_path
      @schemer = JSONSchemer.schema(SCHEMA_PATH)
    end

    def specification
      @specification ||= YAML.safe_load_file(@file_path)
    end

    def valid?
      @schemer.valid?(specification)
    end

    def validate
      @schemer.validate(specification).to_a
    end
  end
end
