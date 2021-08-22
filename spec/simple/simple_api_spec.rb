# frozen_string_literal: true

RSpec.describe SimpleApi do
  it "has a version number" do
    expect(SimpleApi::VERSION).not_to be nil
  end

  it "does something useful" do
    expect { SimpleApi.do_something }.to output("Hello World\n").to_stdout
  end
end
