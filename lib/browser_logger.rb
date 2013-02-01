class BrowserLogger

  def initialize(app)
    @builder = Rack::Builder.new do
      map '/browser_logs' do
        run LogTail.new('development')
      end

      map '/' do
        run app
      end
    end
  end

  def call(env)
    @builder.call(env)
  end
end
