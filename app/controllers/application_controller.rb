class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :redirect_from_www
    
  def redirect_from_www
    return unless Rails.env.production?
    
    redirect_to "https://www.#{request.host_with_port}#{request.path_info}" and return if /^itjo/.match(request.host)
    
    redirect_to "https://#{request.host_with_port}#{request.path_info}" and return if /^www/.match(request.host) && request.scheme == 'http'
  end
end
