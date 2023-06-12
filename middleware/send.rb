class Send
  def initialize(app)
    @app = app
  end

  def call(env)
    env['PATH_INFO'].downcase.gsub(%r{/}, '') == 'time' ? @app.call(env) : error_page
  end

  def error_page
    [
      404,
      { 'Content-Type' => 'text/plain' },
      ['Unknown path | Error 404']
    ]
  end
end
