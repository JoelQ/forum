require 'log_tail'
require 'rack/test'

include Rack::Test::Methods

def app
  @app ||= LogTail.new('development')
end

describe LogTail do
  it 'displays the lastest logs' do
    log = 'content from the log file'
    app.stub(:`).and_return(log)
    get '/'
    last_response.body.should eq log
  end
end
