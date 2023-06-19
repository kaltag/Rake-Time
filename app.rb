class App
  def call(env)
    request = Rack::Request.new(env)
    time = Format.new(request.params)
    time.call!
    response = if time.success?
                 Rack::Response.new(time.body, 200, { 'Content-Type' => 'text/plain' })
               else
                 Rack::Response.new(time.body, 400, { 'Content-Type' => 'text/plain' })
               end
    response.finish
  end
end
