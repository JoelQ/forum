require 'uri'

class HyperlinkResource

  def initialize(url)
    @url = url
  end

  def can_process_url?
    true
  end

  def to_html
    "<a href=\"#{@url}\">#{@url}</a>"
  end
end
