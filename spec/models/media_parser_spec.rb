require_relative '../../app/models/media_parser'
require_relative '../../app/models/hyperlink_resource'

class Content
  attr_accessor :text
end

class TestResource
  def initialize(text)
  end

  def can_process_url?
    true
  end

  def to_html
    'some_html_embed_code'
  end
end

describe MediaParser do
  it 'replaces links in a block of text with embedded html' do
    MediaParser.stub(:resources).and_return([TestResource])
    text = 'Check out this awesome vid! http://youtu.be/NSWOvw5N4nU . I think you will really enjoy'
    parser = MediaParser.new(text)
    parser.parse_links.should eq 'Check out this awesome vid! some_html_embed_code . I think you will really enjoy'
  end

  it 'makes a simple hyperlink if not resource is found' do
    MediaParser.stub(:resources).and_return([])
    parser = MediaParser.new('this is a link http://google.com')
    parser.stub(:replace_url_with_html_embed)
    HyperlinkResource.any_instance.should_receive(:to_html)
    parser.parse_links
  end

  it 'does not modify the content of other objects' do
    object = Content.new
    object.text = 'Check out this awesome pic! http://www.image.com/ . I think you will really enjoy'
    parser = MediaParser.new(object.text)
    parser.parse_links.should eq 'Check out this awesome pic! <a href="http://www.image.com/">http://www.image.com/</a> . I think you will really enjoy'
    object.text.should eq 'Check out this awesome pic! http://www.image.com/ . I think you will really enjoy'
  end
end
