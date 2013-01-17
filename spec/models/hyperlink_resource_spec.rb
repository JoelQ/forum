require_relative '../../app/models/hyperlink_resource'

describe HyperlinkResource do
  it 'outputs an html hyperlink' do
    resource = HyperlinkResource.new('http://google.com')
    resource.to_html.should eq '<a href="http://google.com">http://google.com</a>'
  end
end
