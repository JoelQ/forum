require 'browser_logger'
require 'rack/test'

include Rack::Test::Methods

def app
  @app ||= BrowserLogger.new('development')
end

describe BrowserLogger do
  it 'displays the lastest logs' do
    log = 'content from the log file'
    app.stub(:`).and_return(log)
    get '/'
    last_response.body.should eq log
  end
end
