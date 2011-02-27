class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :redirect_from_www
  before_filter :retrieve_current_loggedin_user
    
  def redirect_from_www
    return unless ENV['production']
    
    redirect_to "https://www.#{request.host_with_port}#{request.path_info}" and return if /^itjo/.match(request.host)
    
    redirect_to "https://#{request.host_with_port}#{request.path_info}" and return if /^www/.match(request.host) && request.scheme == 'http'
  end

  def retrieve_current_loggedin_user
    # @user = User.get(session[:user_id]) unless session[:user_id].nil?
  end
end
