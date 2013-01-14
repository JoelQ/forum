require 'uri'

class RegularYoutubeResource

  MediaParser.register(self)

  def initialize(url)
    @url = URI.parse url
  end

  def to_html
    "<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/#{video_id}\" frameborder=\"0\" allowfullscreen></iframe>"
  end

  def can_process_url?
    @url.host.include?("youtube") && @url.query && @url.query.include?('v=')
  end

  private

  def video_id
    @url.query[2..-1]
  end
end
