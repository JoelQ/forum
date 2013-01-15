require 'uri'

class HyperlinkEmbedder

  def initialize(url)
    @url = url
  end

  def can_process_url?
    true
  end

  def convert_to_media_markup
    "<a href=\"#{@url}\">#{@url}</a>"
  end
end