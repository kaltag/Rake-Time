require 'logger'

class AppLogger
  def initialize(app, **_options)
    @app = app
    @logger = Logger.new($stdout)
  end

  def call(env)
    @logger.info(env)
    @app.call(env)
  end
end
