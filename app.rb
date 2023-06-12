class App
  def call(env)
    @params = Format.new(env['QUERY_STRING'])
    [status, headers, body]
  end

  private

  def status
    @params.errors.empty? ? 200 : 400
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    @params.body
  end
end
