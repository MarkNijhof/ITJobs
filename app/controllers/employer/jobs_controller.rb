
class Employer::JobsController < ApplicationController
  before_filter :is_user_logged_in
  
  def is_user_logged_in
    render :'employer/information/not_logged_in' and return if @user.nil? 
  end

  # GET /employer/jobs
  # GET /employer/jobs.xml
  def index
    @employer_jobs = Employer::Job.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employer_jobs }
    end
  end

  # GET /employer/jobs/1
  # GET /employer/jobs/1.xml
  def show
    @employer_job = Employer::Job.where('_id' => params[:id]).first

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employer_job }
    end
  end

  # GET /employer/jobs/new
  # GET /employer/jobs/new.xml
  def new
    @employer_job = Employer::Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employer_job }
    end
  end

  # GET /employer/jobs/1/edit
  def edit
    @employer_job = Employer::Job.where('_id' => params[:id]).first
  end

  # POST /employer/jobs
  # POST /employer/jobs.xml
  def create
    @employer_job = Employer::Job.new(params[:employer_job])

    respond_to do |format|
      if @employer_job.save
        format.html { redirect_to(@employer_job, :notice => 'Job was successfully created.') }
        format.xml  { render :xml => @employer_job, :status => :created, :location => @employer_job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employer_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employer/jobs/1
  # PUT /employer/jobs/1.xml
  def update
    @employer_job = Employer::Job.where('_id' => params[:id]).first

    respond_to do |format|
      if @employer_job.update(params[:employer_job])
        format.html { redirect_to(@employer_job, :notice => 'Job was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employer_job.errors, :status => :unprocessable_entity }
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
