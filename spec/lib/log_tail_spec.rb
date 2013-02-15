require 'spec_helper'

describe LogTail do
  def app
    @app ||= LogTail.new('development')
  end

  it 'displays the lastest logs' do
    log = 'content from the log file'
    app.stub(:`).and_return(log)
    get '/'
    last_response.body.should eq "<pre>#{log}</pre>"
  end
end
