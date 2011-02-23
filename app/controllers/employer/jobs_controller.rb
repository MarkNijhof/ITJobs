
class Employer::JobsController < ApplicationController
  before_filter :is_user_logged_in
  
  def is_user_logged_in
    # render :'employer/information/not_logged_in' and return if @user.nil? 
  end

  def index
    @employer_jobs = [] #Employer::Job.all
  end

  # GET /employer/jobs/1/
  def edit
    @employer_job = nil #Employer::Job.new and return if params[:id].nil?
    
    #@employer_job = Employer::Job.where('_id' => params[:id]).first
  end

end
