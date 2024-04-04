# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    p 'routes before'
    req = Rack::Request.new(env)
    p 'router after'
    case req.path_info
    when '/'
      [200, { 'Content-Type' => 'text/html' }, ['Hello, World!']]
    when '/about'
      [200, { 'Content-Type' => 'text/html' }, ['About page']]
    else
      [404, { 'Content-Type' => 'text/html' }, ['404 Not Found']]
    end
    # END
  end
end
