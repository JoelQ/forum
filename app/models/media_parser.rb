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
    @resources = self.class.resources << HyperlinkResource
  end

  def parse_links
    @links.each do |link|
      html_snippet = convert_to_media(link)
      replace_url_with_html_embed link, html_snippet
    end
    @text
  end

  def convert_to_media(link)
    resource_class = find_resource_for(link)
    resource_class.new(link).to_html
  end

  private

  def replace_url_with_html_embed(link, html_snippet)
    @text.gsub!(link, html_snippet)
  end

  def find_resource_for(link)
    @resources.find do |resource_class|
      resource_class.new(link).can_process_url?
    end
  end

  Dir[File.expand_path("app/models/resources/*.rb")].each { |file| require file }
end
