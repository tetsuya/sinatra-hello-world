require File.expand_path "../spec_helper.rb", __FILE__

describe "web" do
  context "GET /" do
    before(:each) do
      get "/"
    end
    it "should return 200 ok" do
      expect(last_response).to be_ok
    end
    it "should return body text 'Hello, world!'" do
      expect(last_response.body).to eq "Hello, world!"
    end
  end
end
