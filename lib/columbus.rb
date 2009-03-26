require 'logger'
require 'net/http'
require 'uri'
require 'rubygems'
require 'hpricot'

require File.dirname(__FILE__) + '/columbus/feed'
require File.dirname(__FILE__) + '/columbus/link'
require File.dirname(__FILE__) + '/columbus/redirect_follower'

class Columbus
  attr_reader :url
  
  def initialize(url)
    @url = url
  end
  
  def primary
    @primary ||= begin
      response = RedirectFollower.new(url).resolve
      @url = response.url
      if hpricot_link = parse_links(response.body)[0]
        link_to_feed(hpricot_link)
      end
    end
  end
  
  def all
    @all ||= begin
      response = RedirectFollower.new(url).resolve
      @url = response.url
      parse_links(response.body).map { |hpricot_link| link_to_feed(hpricot_link) }
    end
  end
  
  private  
    def link_to_feed(element)
      link = Link.new(url, element.attributes['href'], element.attributes['title'])
      Feed.new(link.absolute_url, link.clean_title)
    end
  
    def parse_links(html)
      Hpricot(html).search('link').select do |link|
        link.attributes['type'] =~ /application\/(rss|atom)\+xml/i
      end
    end
end