class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :redirect_to_www
    
  def redirect_to_www    
    host = request.host
    
    raise 'what' if /^www/.match(host)
    
    redirect_to "https://www.#{request.host_with_port}#{request.path_info}"
  end
end
