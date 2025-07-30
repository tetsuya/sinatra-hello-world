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
        Timeout::timeout(2) do
          get "/h12"
        end
      }.to raise_error(Timeout::Error)
    end
  end
end
