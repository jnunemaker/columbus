require 'test_helper'

class LinkTest < Test::Unit::TestCase
  context "Initialization" do
    setup do
      @link = Columbus::Link.new('http://railstips.org', 'http://feeds.feedburner.com/railstips', 'Railstips')
    end
    
    should "accept a url" do
      @link.url.should == 'http://railstips.org'
    end

    should "accept an href" do
      @link.href.should == 'http://feeds.feedburner.com/railstips'
    end

    should "accept a title" do
      @link.title.should == 'Railstips'
    end
  end
  
  should "have clean_title" do
    link = Columbus::Link.new
    link.title = " Foo\n"
    link.clean_title.should == "Foo"
  end
  
  context "absolute url" do
    should "be href if href is absolute" do
      link = Columbus::Link.new('http://railstips.org', 'http://railstips.org/feed/atom.xml')
      link.absolute_url.should == 'http://railstips.org/feed/atom.xml'
    end
    
    should "be url plus href if href is root relative" do
      link = Columbus::Link.new('http://railstips.org', '/feed/atom.xml')
      link.absolute_url.should == 'http://railstips.org/feed/atom.xml'
    end
  end
  
end