# frozen_string_literal: true

require "version"

# The API
module SimpleApi
  class Error < StandardError; end

  def self.do_something
    puts "Hello World"
  end
end
