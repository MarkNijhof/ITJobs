class HomeController < ApplicationController
  def index
    render :file => 'public/index.html.template', :layout => false
  end

end
