require 'uri'

class ShortYoutubeResource

  MediaParser.register(self)

  def initialize(url)
    @url = URI.parse url
  end

  def to_html
    "<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/#{video_id}\" frameborder=\"0\" allowfullscreen></iframe>"
  end

  def can_process_url?
    @url.host.include? "youtu.be"
  end

  private

  def video_id
    @url.path.gsub('/', '')
  end
end
