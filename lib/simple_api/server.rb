# frozen_string_literal: true

$LOAD_PATH << File.expand_path(".", __dir__)

require "simple_api"
require "sinatra"

# https://ruby-doc.org/core-3.0.0/IO.html#method-i-sync-3D
$stdout.sync = true
$stderr.sync = true

# The API
module SimpleApi
  class Error < StandardError; end

  # The Server API
  class Server < Sinatra::Application
    get "/" do
      "Hello World\n"
    end
  end
end
