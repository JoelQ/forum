require 'rack/test'
require 'browser_logger'

describe BrowserLogger do
  def app
    BrowserLogger.new(fake_rails)
  end

  def fake_rails
    Proc.new {|env| [200, {}, ['hi']]}
  end

  it 'should send the request to the tail when url is /browser_logs' do
    LogTail.any_instance.should_receive(:call).and_return([200, {}, ["hi"]])
    get '/browser_logs'
  end

  it 'should send the request to the Rails when url is not /browser_logs' do
    fake_rails.should_receive(:call).and_return([200, {}, ["hi"]])
    get '/'
  end

end
