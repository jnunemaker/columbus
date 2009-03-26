require 'test_helper'

class ColumbusTest < Test::Unit::TestCase
  context "Initialization" do
    should "accept a url" do
      Columbus.new('http://foobar.com').url.should == 'http://foobar.com'
    end
  end
  
  should "be able to get primary feed" do
    FakeWeb.register_uri(:get, "http://railstips.org/", :string => fixture_file('railstips.html'))
    FakeWeb.register_uri(:get, "http://feeds.feedburner.com/railstips", :string => fixture_file('railstips_feedburner.html'))
    expected = Columbus::Feed.new('http://feeds.feedburner.com/railstips', 'Railstips Articles')
    Columbus.new('http://railstips.org').primary.should == expected
  end
  
  should "be able to get all feeds" do
    FakeWeb.register_uri(:get, "http://railstips.org/", :string => fixture_file('railstips.html'))
    FakeWeb.register_uri(:get, "http://feeds.feedburner.com/railstips", :string => fixture_file('railstips_feedburner.html'))
    FakeWeb.register_uri(:get, "http://feeds.feedburner.com/railsquicktips", :string => fixture_file('railsquicktips.html'))
    Columbus.new('http://railstips.org').all.should == [
      Columbus::Feed.new('http://feeds.feedburner.com/railstips', 'Railstips Articles'),
      Columbus::Feed.new('http://feeds.feedburner.com/railsquicktips', 'Rails Quick Tips (links)')
    ]
  end
  
  should "follow redirects" do
    FakeWeb.register_uri(:get, "http://railstips.org/", :string => fixture_file('railstips.html'))
    FakeWeb.register_uri(:get, "http://feeds.feedburner.com/railstips", :response => fixture_file('railstips_redirect'))
    FakeWeb.register_uri(:get, "http://feeds2.feedburner.com/railstips", :string => fixture_file('railstips_feedburner.html'))
    primary = Columbus.new('http://railstips.org').primary
    primary.url.should == 'http://feeds2.feedburner.com/railstips'
    primary.title.should == 'Railstips Articles'
  end
  
end
