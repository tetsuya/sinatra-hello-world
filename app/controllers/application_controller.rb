require "sinatra/base"
require "json"

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

  get "/cpu" do
    # Generate CPU utilization by performing intensive calculations
    iterations = params[:iterations]&.to_i || 1_000_000
    
    start_time = Time.now
    result = 0
    
    # Perform CPU-intensive calculations
    iterations.times do |i|
      # Mathematical operations that consume CPU cycles
      result += Math.sqrt(i) * Math.sin(i) * Math.cos(i)
      result += (i ** 2) % 1000
      
      # Add some string operations for variety
      temp_string = "cpu_test_#{i}"
      result += temp_string.length
    end
    
    end_time = Time.now
    duration = (end_time - start_time).round(3)
    
    content_type :json
    {
      message: "CPU utilization test completed",
      iterations: iterations,
      duration_seconds: duration,
      result: result.round(2)
    }.to_json
  end
end
