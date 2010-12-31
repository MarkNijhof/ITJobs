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
    @beta_user = ""
    @person = nil
    user_id = session[:user_id]
    if !user_id.nil?
      @person = Person.new
#      @beta_user = @person.beta_user if !@person.nil?
    end
  end

end
