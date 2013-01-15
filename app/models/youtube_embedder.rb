require 'uri'

class YouTubeEmbedder

  def initialize(url)
    @url = url
    url_components = URI.split(url)
    @host = url_components[2]
    @path = url_components[5]
    @query = url_components[7]
  end

  def can_process_url?
    url_is_a_youtube_short? || url_is_a_youtube_regular?
  end

  def convert_to_media_markup
    "<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/#{video_id}\" frameborder=\"0\" allowfullscreen></iframe>"
  end

  private

  def video_id
    url_is_a_youtube_regular? ? @query[2..-1] : @path.gsub('/', '')
  end

  def url_is_a_youtube_regular?
    @host.include?("youtube") && @query && @query.include?('v=')
  end

  def url_is_a_youtube_short?
    @host.include? "youtu.be"
  end
end