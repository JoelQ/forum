require_relative '../../../app/models/media_parser'

describe ImageResource do
  it 'accepts PNG images' do
    resource = ImageResource.new('http://image.com/image.png')
    resource.can_process_url?.should be_true
  end

  it 'accepts GIF images' do
    resource = ImageResource.new('http://image.com/image.gif')
    resource.can_process_url?.should be_true
  end

  it 'accepts JPEG images' do
    resource = ImageResource.new('http://image.com/image.jpg')
    resource.can_process_url?.should be_true
  end

  it 'converts a link into an html image tag' do
    resource = ImageResource.new('http://image.com/image.png')
    resource.to_html.should eq '<img src="http://image.com/image.png" />'
  end

end
