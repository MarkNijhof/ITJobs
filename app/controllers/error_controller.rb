class ErrorController < ApplicationController
  def handle404
    @url_that_was_not_found = "#{request.scheme}://#{request.host}#{request.path_info}"   
    render :template => "/error/handle404.html.haml", :status => 404
  end

end
