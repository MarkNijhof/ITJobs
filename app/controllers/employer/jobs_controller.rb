module Employer
  class JobsController < ApplicationController
    def index
      @jobs = [] #Employer::Job.where(:published => true)
    end

    def edit
      @jobs = [] #Employer::Job.where(:published => true)
    end
  end
end
