# frozen_string_literal: true

require "sinatra"
require "json"

# https://ruby-doc.org/core-3.0.0/IO.html#method-i-sync-3D
$stdout.sync = true
$stderr.sync = true

module SimpleApi
  class Error < StandardError; end

  # The Server API
  class Server < Sinatra::Application
    get "/" do
      "Hello World\n"
    end

    get "/healthcheck" do
      content_type :json

      health = "unhealthy"
      code = 503

      if File.exist?("REVISION")
        health = "healthy"
        code = 200
      end

      body({ status: health.to_s }.to_json)
      status code
    end

    get "/metadata" do
      content_type :json

      last_commit_sha = "no commit sha found"
      last_commit_sha = IO.read("REVISION") if File.exist?("REVISION")

      {
        myapplication: [
          {
            version: VERSION,
            description: "simple api",
            lastcommitsha: last_commit_sha.strip.to_s,
            foo: "bar"
          }
        ]
      }.to_json
    end
  end
end
