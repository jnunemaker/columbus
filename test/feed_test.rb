require 'test_helper'

class FeedTest < Test::Unit::TestCase  
  context "Initialization" do
    setup do
      @body = fixture_file('railstips.html')
      FakeWeb.register_uri(:get, "http://feeds.feedburner.com/railstips", :string => @body)
      @feed = Columbus::Feed.new('http://feeds.feedburner.com/railstips', 'Railstips')
    end
    
    should "accept a url" do
      @feed.url.should == 'http://feeds.feedburner.com/railstips'
    end
    
    should "accept a title" do
      @feed.title = 'Railstips'
    end
    
    should "set body to feed endpoint response body" do
      @feed.body.should == @body
    end
  end
end