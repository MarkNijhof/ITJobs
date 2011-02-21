class HomeController < ApplicationController
  def index
    @jobs = [] #Employer::Job.where(:published => true)
  end

end
