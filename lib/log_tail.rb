class LogTail

  def initialize(environment)
    @environment = environment
  end

  def call(env)
    log = `tail -n 25  log/#{@environment}.log`
    [200, {}, [log]]
  end
end
