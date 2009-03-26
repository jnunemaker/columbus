class Columbus
  class Feed < Struct.new(:url, :title)
    attr_accessor :body
    
    def initialize(*args)
      super(*args)
      determine_feed_endpoint
    end
    
    def determine_feed_endpoint
      response = RedirectFollower.new(url).resolve
      self.url = response.url
      self.body = response.body
      self
    end
  end
end