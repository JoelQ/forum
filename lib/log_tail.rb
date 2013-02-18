class LogTail

  def initialize(environment)
    @environment = environment
  end

  def call(env)
    [200, {'Content-Type' => 'text/html'}, [formatted_log]]
  end

  private

  def formatted_log
    "<pre>#{log}</pre>"
  end

  def log
    `tail -n 25 log/#{@environment}.log`
  end
end
