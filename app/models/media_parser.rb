require 'uri'

class MediaParser
  EMBEDDERS = [ImageEmbedder, YouTubeEmbedder, HyperlinkEmbedder]

  def initialize(text)
    @text = text
    @links = URI.extract @text
  end

  def parse_links
    @links.each do |link|
      embedable_media = convert_to_media(link)
      replace_url_with_html_embed link, embedable_media
    end
    @parsed_text
  end

  def convert_to_media(link)
    EMBEDDERS.each do |embedder_class|
      embedder = embedder_class.new(link)
      if embedder.can_process_url?
        return embedder.convert_to_media_markup
      end
    end
  end

  private

  def replace_url_with_html_embed(link, html_snippet)
    source = @parsed_text || @text
    @parsed_text = source.gsub(link, html_snippet)
  end
end
