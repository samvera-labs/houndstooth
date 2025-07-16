# frozen_string_literal: true

require "houndstooth/validate"

RSpec.describe Houndstooth::Validator do
  let(:valid_file) { "spec/fixtures/valid.yml" }
  let(:invalid_file) { "spec/fixtures/invalid.yml" }
  let(:non_existent_file) { "spec/fixtures/non_existent.yml" }

  describe "#initialize" do
    it "initializes with a valid file path" do
      expect { described_class.new(valid_file) }.not_to raise_error
    end

    it "raises an error for a non-existent file" do
      expect { described_class.new(non_existent_file) }.to raise_error("File not found: #{non_existent_file}")
    end
  end

  describe "#valid?" do
    it "returns true for a valid specification" do
      validator = described_class.new(valid_file)
      expect(validator.valid?).to be true
    end

    it "returns false for an invalid specification" do
      validator = described_class.new(invalid_file)
      expect(validator.valid?).to be false
    end
  end

  describe "#validate" do
    it "returns an empty array for a valid specification" do
      validator = described_class.new(valid_file)
      expect(validator.validate).to be_empty
    end

    it "returns an array of errors for an invalid specification" do
      validator = described_class.new(invalid_file)
      errors = validator.validate
      expect(errors).not_to be_empty
      expect(errors.first['type']).to eq('required')
      expect(errors.first['details']['missing_keys']).to eq(['profile'])
    end
  end
end 