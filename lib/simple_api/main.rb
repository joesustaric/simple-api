# frozen_string_literal: true

$LOAD_PATH << File.expand_path(".", __dir__)

require "simple_api"

SimpleApi::Server.run!
