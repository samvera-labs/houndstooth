# frozen_string_literal: true

require_relative "lib/houndstooth/version"

Gem::Specification.new do |spec|
  spec.name = "houndstooth"
  spec.version = Houndstooth::VERSION
  spec.authors = ["Samvera Community"]
  spec.email = ["samvera-community@googlegroups.com"]

  spec.summary = "A Ruby gem for validating M3 metadata profiles."
  spec.description = "Houndstooth provides a validator and other utilities for working with M3, a metadata model for digital repositories."
  spec.homepage = "https://github.com/samvera-labs/houndstooth"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/samvera-labs/houndstooth"
  spec.metadata["changelog_uri"] = "https://github.com/samvera-labs/houndstooth/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir['{exe,lib,data,examples}/**/*', 'LICENSE.txt', 'README.md']

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "json_schemer", "~> 0.2.0"
end
