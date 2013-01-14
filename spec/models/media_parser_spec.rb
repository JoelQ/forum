require_relative '../../app/models/media_parser'

describe MediaParser do
  describe 'parsing text for media' do
    context 'when contains link to an image' do
      it 'converts the link to HTMl image tag' do
        text = 'Check out this awesome pic! http://www.image.com/cat_pic.png . I think you will really enjoy'
        parser = MediaParser.new(text)
        parser.parse.should eq 'Check out this awesome pic! <img src="http://www.image.com/cat_pic.png" /> . I think you will really enjoy'
      end
    end
  end
end