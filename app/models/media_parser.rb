require 'uri'

class MediaParser

  def initialize(text)
    @text = text
    @links = URI.extract @text
  end

  def parse_links
    @links.each do |link|
      media = convert_to_media(link)
      embed link, media
    end
    @parsed_text
  end

  def convert_to_media(link)
    if URI.split(link)[5].end_with? 'png', 'gif', 'jpeg'
      "<img src=\"#{link}\" />"
    elsif URI.split(link)[2].include?("youtube") && URI.split(link)[7] && URI.split(link)[7].include?('v=')
      video_id = URI.split(link)[7][2..-1]
      "<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/#{video_id}\" frameborder=\"0\" allowfullscreen></iframe>"
    elsif URI.split(link)[2].include? "youtu.be"
      video_id = URI.split(link)[5].gsub('/', '')
      "<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/#{video_id}\" frameborder=\"0\" allowfullscreen></iframe>"
    else
      "<a href=\"#{link}\">#{link}</a>"
    end
  end

  def embed(link, media)
    source = @parsed_text || @text
    @parsed_text = source.gsub(link, media)
  end
end
