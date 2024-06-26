# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    p 'admin_before'
    req = Rack::Request.new(env)
    p 'admin_after'
    return [403, {}, []] if req.path_info.start_with? '/admin'
    @app.call(env)
    # END
  end
end
