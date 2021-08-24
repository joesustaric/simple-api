# frozen_string_literal: true

require "sinatra"
require "json"

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

    get "/healthcheck" do
      content_type :json

      { status: "healthy" }.to_json
    end

    get "/metadata" do
      content_type :json

      {
        myapplication: [
          {
            version: VERSION,
            description: "simple api",
            lastcommitsha: "abc57858585"
          }
        ]
      }.to_json
    end
  end
end
