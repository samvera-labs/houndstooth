# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec

namespace :lint do
  desc "Run yamllint on example files"
  task :yaml do
    puts "Linting YAML files..."
    files = Dir.glob("examples/**/*.y*ml")
    system("bundle", "exec", "yamllint", *files)
    raise "yamllint failed" unless $?.success?
  end
end

desc "Run all linters"
task lint: ["lint:yaml"]

desc "Run all tests and linters"
task test: [:spec, :lint]
