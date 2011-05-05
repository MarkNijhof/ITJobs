class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter :redirect_to_www
  #   
  # def redirect_to_www
  #   host = request.host
  #   
  #   return if /^www/.match(host)
  #   return if /^test/.match(host)
  #   return if /^staging/.match(host)
  #   return if /^local/.match(host)
  #   
  #   redirect_to "https://www.#{request.host_with_port}#{request.path_info}"
  # end
end
