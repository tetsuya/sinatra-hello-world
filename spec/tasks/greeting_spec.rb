require File.expand_path "../../spec_helper.rb", __FILE__
require "rake"

describe "rake greeting" do
  before(:all) do
    load "tasks/greeting.rake"
  end
  context ":english" do
    subject(:task) { Rake.application["greeting:english"] }
    it "should return 'Hello!'" do
      expect{task.invoke}.to output("Hello!\n").to_stdout
    end
  end
  context ":japanese" do
    subject(:task) { Rake.application["greeting:japanese"] }
    it "should contain 'こんにちは'" do
      expect{task.invoke}.to output("こんにちは!\n").to_stdout
    end
  end
end
