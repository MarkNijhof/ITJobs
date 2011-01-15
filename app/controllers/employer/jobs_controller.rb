
class Employer::JobsController < ApplicationController
  before_filter :is_user_logged_in
  
  def is_user_logged_in
    render :'employer/information/not_logged_in' and return if @user.nil? 
  end

  def index
    @employer_jobs = Employer::Job.all
  end

  # GET /employer/jobs/1/
  def edit
    @employer_job = Employer::Job.new and return if params[:id].nil?
    
    @employer_job = Employer::Job.where('_id' => params[:id]).first
  end

  # POST /employer/jobs
  def create
    @employer_job = Employer::Job.new(params[:employer_job])

    respond_to do |format|
      if @employer_job.save
        format.html { redirect_to(@employer_job, :notice => 'Job was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /employer/jobs/1
  def update
    @employer_job = Employer::Job.where('_id' => params[:id]).first

    respond_to do |format|
      if @employer_job.update(params[:employer_job])
        format.html { redirect_to(@employer_job, :notice => 'Job was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /employer/jobs/1
  # DELETE /employer/jobs/1.xml
  def destroy
    @employer_job = Employer::Job.where('_id' => params[:id]).first
    @employer_job.destroy

    respond_to do |format|
      format.html { redirect_to(employer_jobs_url) }
      format.xml  { head :ok }
    end
  end
end
