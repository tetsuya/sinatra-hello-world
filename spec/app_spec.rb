require File.expand_path "../spec_helper.rb", __FILE__

describe "web" do
  context "GET /" do
    before(:each) do
      get "/"
    end
    it "should return 200 ok" do
      expect(last_response).to be_ok
    end
    it "should return pong" do
      expect(last_response.body).to eq "Hello, world!"
    end
  end
  context "GET /h12" do
    it "should timeout after reasonable time" do
      # Use Timeout to avoid waiting the full 31 seconds in tests
      expect {
        Timeout.timeout(2) do
          get "/h12"
        end
      }.to raise_error(Timeout::Error)
    end
  end
  
  context "GET /cpu" do
    it "should return 200 ok" do
      get "/cpu"
      expect(last_response).to be_ok
    end
    
    it "should return JSON with CPU test results" do
      get "/cpu", iterations: 1000
      expect(last_response.content_type).to include("application/json")
      
      response_data = JSON.parse(last_response.body)
      expect(response_data).to have_key("message")
      expect(response_data).to have_key("iterations")
      expect(response_data).to have_key("duration_seconds")
      expect(response_data).to have_key("result")
      expect(response_data["iterations"]).to eq(1000)
    end
    
    it "should use default iterations when none provided" do
      get "/cpu"
      response_data = JSON.parse(last_response.body)
      expect(response_data["iterations"]).to eq(1_000_000)
    end
  end
end
