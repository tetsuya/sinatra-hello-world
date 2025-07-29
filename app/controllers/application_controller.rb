require "sinatra/base"

class ApplicationController < Sinatra::Base
  configure do
    set :views, File.expand_path("../views", __dir__)
    set :public_folder, File.expand_path("../public", __dir__)
  end

  get "/" do
    "Hello, world!"
  end
end