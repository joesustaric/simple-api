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
    context "Given there is a REVISION file with content" do
      before { File.open("REVISION", "w") { |f| f.write "a git sha\n" } }

      context "When we call /healthcheck" do
        it "responds with 200 when healthy" do
          get "/healthcheck"

          expect(last_response.status).to eq 200
          expect(last_response.body).to eq({ status: "healthy" }.to_json)
        end
      end

      after { File.delete("REVISION") if File.exist?("REVISION") }
    end

    context "Given there is no REVISION file" do
      before { File.delete("REVISION") if File.exist?("REVISION") }

      context "When we call /healthcheck" do
        it "responds with 503 (service unavailable) " do
          get "/healthcheck"

          expect(last_response.status).to eq 503
          expect(last_response.body).to eq({ status: "unhealthy" }.to_json)
        end
      end
    end
  end

  describe "/metadata" do
    context "Given the service is healthy" do
      before do
        File.open("REVISION", "w") { |f| f.write "some-git-sha\n" }
      end
      context "When we call /metadata" do
        it "responds with json metadata" do
          response = {
            myapplication: [
              {
                version: SimpleApi::VERSION,
                description: "simple api joe",
                lastcommitsha: "some-git-sha",
                foo: "bar"
              }
            ]
          }.to_json

          get "/metadata"

          expect(last_response).to be_ok
          expect(last_response.body).to eq response
        end

        after do
          File.delete("REVISION") if File.exist?("REVISION")
        end
      end
    end

    context "Given the service is unhealthy" do
      before { File.delete("REVISION") if File.exist?("REVISION") }

      context "When we call /metadata" do
        it "responds with json metadata" do
          response = {
            myapplication: [
              {
                version: SimpleApi::VERSION,
                description: "simple api joe",
                lastcommitsha: "no commit sha found",
                foo: "bar"
              }
            ]
          }.to_json

          get "/metadata"

          expect(last_response).to be_ok
          expect(last_response.body).to eq response
        end

        after do
          File.delete("REVISION") if File.exist?("REVISION")
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
