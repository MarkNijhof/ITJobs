# require 'spec_helper'
# 
# describe Employer::JobsController do
# 
#   def mock_job(stubs={})
#     (@mock_job ||= mock_model(Employer::Job).as_null_object).tap do |job|
#       job.stub(stubs) unless stubs.empty?
#     end
#   end
# 
#   describe "GET index" do
#     it "assigns all employer_jobs as @employer_jobs" do
#       Employer::Job.stub(:all) { [mock_job] }
#       get :index
#       assigns(:employer_jobs).should eq([mock_job])
#     end
#   end
# 
#   describe "GET show" do
#     it "assigns the requested job as @job" do
#       Employer::Job.stub(:first).with("37") { mock_job }
#       get :show, :id => "37"
#       assigns(:job).should be(mock_job)
#     end
#   end
# 
#   describe "GET new" do
#     it "assigns a new job as @job" do
#       Employer::Job.stub(:new) { mock_job }
#       get :new
#       assigns(:job).should be(mock_job)
#     end
#   end
# 
#   describe "GET edit" do
#     it "assigns the requested job as @job" do
#       Employer::Job.stub(:first).with("37") { mock_job }
#       get :edit, :id => "37"
#       assigns(:job).should be(mock_job)
#     end
#   end
# 
#   describe "POST create" do
# 
#     describe "with valid params" do
#       it "assigns a newly created job as @job" do
#         Employer::Job.stub(:new).with({'these' => 'params'}) { mock_job(:save => true) }
#         post :create, :job => {'these' => 'params'}
#         assigns(:job).should be(mock_job)
#       end
# 
#       it "redirects to the created job" do
#         Employer::Job.stub(:new) { mock_job(:save => true) }
#         post :create, :job => {}
#         response.should redirect_to(employer_job_url(mock_job))
#       end
#     end
# 
#     describe "with invalid params" do
#       it "assigns a newly created but unsaved job as @job" do
#         Employer::Job.stub(:new).with({'these' => 'params'}) { mock_job(:save => false) }
#         post :create, :job => {'these' => 'params'}
#         assigns(:job).should be(mock_job)
#       end
# 
#       it "re-renders the 'new' template" do
#         Employer::Job.stub(:new) { mock_job(:save => false) }
#         post :create, :job => {}
#         response.should render_template("new")
#       end
#     end
# 
#   end
# 
#   describe "PUT update" do
# 
#     describe "with valid params" do
#       it "updates the requested job" do
#         Employer::Job.should_receive(:first).with("37") { mock_job }
#         mock_employer_job.should_receive(:update).with({'these' => 'params'})
#         put :update, :id => "37", :job => {'these' => 'params'}
#       end
# 
#       it "assigns the requested job as @job" do
#         Employer::Job.stub(:first) { mock_job(:update => true) }
#         put :update, :id => "1"
#         assigns(:job).should be(mock_job)
#       end
# 
#       it "redirects to the job" do
#         Employer::Job.stub(:first) { mock_job(:update => true) }
#         put :update, :id => "1"
#         response.should redirect_to(employer_job_url(mock_job))
#       end
#     end
# 
#     describe "with invalid params" do
#       it "assigns the job as @job" do
#         Employer::Job.stub(:first) { mock_job(:update => false) }
#         put :update, :id => "1"
#         assigns(:job).should be(mock_job)
#       end
# 
#       it "re-renders the 'edit' template" do
#         Employer::Job.stub(:first) { mock_job(:update => false) }
#         put :update, :id => "1"
#         response.should render_template("edit")
#       end
#     end
# 
#   end
# 
#   describe "DELETE destroy" do
#     it "destroys the requested job" do
#       Employer::Job.should_receive(:first).with("37") { mock_job }
#       mock_employer_job.should_receive(:destroy)
#       delete :destroy, :id => "37"
#     end
# 
#     it "redirects to the employer_jobs list" do
#       Employer::Job.stub(:first) { mock_job }
#       delete :destroy, :id => "1"
#       response.should redirect_to(employer_jobs_url)
#     end
#   end
# 
# end
