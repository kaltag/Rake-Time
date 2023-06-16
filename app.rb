class App
  def call(env)
    request = Rack::Request.new(env)
    time = Format.new(request.params)
    if time.success?
      response(200, time.body)
    else
      response(400, time.body)
    end
  end

  private

  def response(status, body)
    [
      status,
      { 'Content-Type' => 'text/plain' },
      [body]
    ]
  end
end
