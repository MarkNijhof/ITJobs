class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :redirect_from_www
  before_filter :retrieve_current_loggedin_user
    
  def redirect_from_www
    host = request.host
    
    return if /^www/.match(host)
    return if /^test/.match(host)
    return if /^staging/.match(host)
    return if /^local/.match(host)
    
    redirect_to "https://www.#{request.host_with_port}#{request.path_info}"
  end

  def retrieve_current_loggedin_user
    # @user = User.get(session[:user_id]) unless session[:user_id].nil?
  end
end
