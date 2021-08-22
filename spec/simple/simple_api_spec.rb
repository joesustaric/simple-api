# frozen_string_literal: true

RSpec.describe "The SimpleApi App" do
  # include Rack::Test::Methods

  def app
    SimpleApi::Server
  end

  it "has a version number" do
    expect(SimpleApi::VERSION).not_to be nil
  end

  it "says hello" do
    get "/"
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Hello World\n")
  end
end
