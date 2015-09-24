require 'socket'
require "net/http"
module Jekyll
  class RenderIpAddress < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def remote_ip
      # @remote_ip ||= Socket.ip_address_list.find { |ai| ai.ipv4? && !ai.ipv4_loopback? }.ip_address.to_s()
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
       #"90.216.134, 90.216.135"
       "90.216.134.196"
    end
  end

end

Liquid::Template.register_tag('remote_ip', Jekyll::RenderIpAddress)
Liquid::Template.register_tag('ip_range', Jekyll::RenderIpList)

