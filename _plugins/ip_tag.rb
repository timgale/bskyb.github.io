require 'socket'
require "net/http"
module Jekyll
  class RenderIpAddress < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def remote_ip
      # Get the Public IP address
      @remote_ip ||= Net::HTTP.get(URI("https://api.ipify.org"))
	end

    def render(context)
       remote_ip
    end
  end

  class RenderIpList < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
       # Sky IP Range 
       "90.216.134,90.216.150" 

       # Testing range for use on internal network
       # "90.216.135,90.216.151"
    end
  end

end

Liquid::Template.register_tag('remote_ip', Jekyll::RenderIpAddress)
Liquid::Template.register_tag('ip_range', Jekyll::RenderIpList)

