require "spec_helper"

describe Employer::JobsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/employer_jobs" }.should route_to(:controller => "employer_jobs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/employer_jobs/new" }.should route_to(:controller => "employer_jobs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/employer_jobs/1" }.should route_to(:controller => "employer_jobs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/employer_jobs/1/edit" }.should route_to(:controller => "employer_jobs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/employer_jobs" }.should route_to(:controller => "employer_jobs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/employer_jobs/1" }.should route_to(:controller => "employer_jobs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/employer_jobs/1" }.should route_to(:controller => "employer_jobs", :action => "destroy", :id => "1")
    end

  end
end
