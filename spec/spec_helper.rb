require "rack/test"
require "rspec"

ENV["RACK_ENV"] = "test"

require File.expand_path "../../web.rb", __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end
end

RSpec.configure { |c| c.include RSpecMixin }
