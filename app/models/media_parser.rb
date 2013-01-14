require 'uri'

class MediaParser

  def initialize(text)
    @text = text
    @links = URI.extract @text
  end

  def parse
    @links.each do |link|
      puts(media = convert_to_media(link))
      embed link, media
    end
    @text
  end

  def convert_to_media(link)
    if URI.split(link)[5].end_with? "png"
      "<img src='#{link}' />"
    end
  end

  def embed(link, media)
    @text.gsub!(/link/, media)
  end
end
