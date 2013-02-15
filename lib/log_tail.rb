class LogTail

  def initialize(environment)
    @environment = environment
  end

  def call(env)
    log = `tail -n 25  log/#{@environment}.log`
    formatted_log = "<pre>#{log}</pre>"
    [200, {'Content-Type' => 'text/html'}, [formatted_log]]
  end
end
