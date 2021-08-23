# frozen_string_literal: true

require "sinatra"

# https://ruby-doc.org/core-3.0.0/IO.html#method-i-sync-3D
$stdout.sync = true
$stderr.sync = true

# The API
module SimpleApi
  class Error < StandardError; end

  # The Server API
  class Server < Sinatra::Base
    get "/" do
      "Hello World\n"
    end
  end
end
