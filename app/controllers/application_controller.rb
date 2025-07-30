require "sinatra/base"

class ApplicationController < Sinatra::Base
  configure do
    set :views, File.expand_path("../views", __dir__)
    set :public_folder, File.expand_path("../public", __dir__)
  end

  get "/" do
    "Hello, world!"
  end

  get "/h12" do
    # Sleep for 31 seconds to trigger Heroku H12 timeout error
    # Heroku times out requests after 30 seconds
    sleep 31
    "This response should never be seen due to H12 timeout"
  end
end
