class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :redirect_from_www
  before_filter :retrieve_current_loggedin_user
    
  def redirect_from_www
    if /^www/.match(request.host)
      redirect_to request.scheme + '://' + request.host_with_port[4..-1] + request.path_info       
    end
  end

  def retrieve_current_loggedin_user
    
    @user = User.find_using_session_id(session[:user_id]) unless session[:user_id].nil?
  end

end
