# frozen_string_literal: true

require "json"
# rubocop:disable Metrics/BlockLength
RSpec.describe "The SimpleApi App" do
  def app
    SimpleApi::Server
  end

  it "has a version number" do
    expect(SimpleApi::VERSION).not_to be nil
  end

  describe "/" do
    it "says hello" do
      get "/"

      expect(last_response).to be_ok
      expect(last_response.body).to eq("Hello World\n")
    end
  end

  describe "/healthcheck" do
    it "responds with 200 when healthy" do
      get "/healthcheck"

      expect(last_response).to be_ok
      expect(last_response.body).to eq({ status: "healthy" }.to_json)
    end
  end

  describe "/metadata" do
    it "responds with json metadata" do
      response = {
        myapplication: [
          {
            version: SimpleApi::VERSION,
            description: "simple api",
            lastcommitsha: "abc57858585"
          }
        ]
      }.to_json

      get "/metadata"

      expect(last_response).to be_ok
      expect(last_response.body).to eq response
    end
  end
end
# rubocop:enable Metrics/BlockLength
