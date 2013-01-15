require 'uri'

class ImageEmbedder

  def initialize(url)
    @url = url
  end

  def can_process_url?
    path = URI.split(@url)[5]
    path.end_with? 'png', 'gif', 'jpeg'
  end

  def convert_to_media_markup
    "<img src=\"#{@url}\" />"
  end
end