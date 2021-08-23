# frozen_string_literal: true

$LOAD_PATH << File.expand_path("../lib/simple_api", __dir__)

require "rspec"
require "rack/test"
require "simple_api"

ENV["APP_ENV"] = "test"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.include Rack::Test::Methods

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
