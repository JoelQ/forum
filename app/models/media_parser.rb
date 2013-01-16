require 'uri'

class MediaParser
  @resources  = []

  def self.register(resource)
    @resources << resource
  end

  def self.resources
    @resources.dup
  end

  def initialize(text)
    @text = text.dup
    @links = URI.extract @text
    @resources = self.class.resources
  end

  def parse_links
    @links.each do |link|
      html_snippet = convert_to_media(link)
      replace_url_with_html_embed link, html_snippet
    end
    @text
  end

  def convert_to_media(link)
    @resources.each do |resource_class|
      resource = resource_class.new(link)
      if resource.can_process_url?
        return resource.to_html
      end
    end
    HyperlinkResource.new(link).to_html
  end

  private

  def replace_url_with_html_embed(link, html_snippet)
    @text.gsub!(link, html_snippet)
  end

  Dir[File.expand_path("app/models/resources/*.rb")].each { |file| require file }
end
