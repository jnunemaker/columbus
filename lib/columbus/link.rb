class Columbus
  class Link < Struct.new(:url, :href, :title)    
    def clean_title
      title.nil? ? nil : title.strip
    end
    
    def absolute_url
      if relative?
        "#{url}#{href}"
      else
        "#{href}"
      end
    end
    
    def relative?
      href =~ /^\//
    end
  end
end