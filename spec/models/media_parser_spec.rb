require_relative '../../app/models/image_embedder'
require_relative '../../app/models/youtube_embedder'
require_relative '../../app/models/hyperlink_embedder'
require_relative '../../app/models/media_parser'

class Content
  attr_accessor :text
end

describe MediaParser do
  describe 'image links' do
    context 'when PNG' do
      it 'converts the link to HTMl image tag' do
        text = 'Check out this awesome pic! http://www.image.com/cat_pic.png . I think you will really enjoy'
        parser = MediaParser.new(text)
        parser.parse_links.should eq 'Check out this awesome pic! <img src="http://www.image.com/cat_pic.png" /> . I think you will really enjoy'
      end
    end

    context 'when GIF' do
      it 'converts the link to HTMl image tag' do
        text = 'Check out this awesome pic! http://www.image.com/cat_pic.gif . I think you will really enjoy'
        parser = MediaParser.new(text)
        parser.parse_links.should eq 'Check out this awesome pic! <img src="http://www.image.com/cat_pic.gif" /> . I think you will really enjoy'
      end
    end

    context 'when JPEG' do
      it 'converts the link to HTMl image tag' do
        text = 'Check out this awesome pic! http://www.image.com/cat_pic.jpeg . I think you will really enjoy'
        parser = MediaParser.new(text)
        parser.parse_links.should eq 'Check out this awesome pic! <img src="http://www.image.com/cat_pic.jpeg" /> . I think you will really enjoy'
      end
    end
  end

  describe 'YouTube links' do
    context 'when standard YouTube url' do
      it 'embeds the video using youtube\'s embed code' do
        text = 'Check out this awesome vid! http://www.youtube.com/watch?v=NSWOvw5N4nU . I think you will really enjoy'
        parser = MediaParser.new(text)
        parser.parse_links.should eq 'Check out this awesome vid! <iframe width="560" height="315" src="http://www.youtube.com/embed/NSWOvw5N4nU" frameborder="0" allowfullscreen></iframe> . I think you will really enjoy'
      end
    end

    context 'when shorter share url' do
      it 'embeds the video using youtube\'s embed code' do
        text = 'Check out this awesome vid! http://youtu.be/NSWOvw5N4nU . I think you will really enjoy'
        parser = MediaParser.new(text)
        parser.parse_links.should eq 'Check out this awesome vid! <iframe width="560" height="315" src="http://www.youtube.com/embed/NSWOvw5N4nU" frameborder="0" allowfullscreen></iframe> . I think you will really enjoy'
      end
    end
  end

  describe 'other types of links' do
    context 'when contains a link to something else' do
      it 'converts the link to HTMl anchor tag' do
        text = 'Check out this awesome pic! http://www.image.com/ . I think you will really enjoy'
        parser = MediaParser.new(text)
        parser.parse_links.should eq 'Check out this awesome pic! <a href="http://www.image.com/">http://www.image.com/</a> . I think you will really enjoy'
      end
    end


    context 'when parsing content of another object' do
      it 'does not modify the content of that object' do
        object = Content.new
        object.text = 'Check out this awesome pic! http://www.image.com/ . I think you will really enjoy'
        parser = MediaParser.new(object.text)
        parser.parse_links.should eq 'Check out this awesome pic! <a href="http://www.image.com/">http://www.image.com/</a> . I think you will really enjoy'
        object.text.should eq 'Check out this awesome pic! http://www.image.com/ . I think you will really enjoy'
      end
    end
  end
end
