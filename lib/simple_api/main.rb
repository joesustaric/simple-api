# frozen_string_literal: true

$LOAD_PATH << File.expand_path(".", __dir__)

require "rack/protection"
require "simple_api"

# http://sinatrarb.com/protection/
use Rack::Protection

SimpleApi::Server.run!
