require 'spec_helper'

describe ErrorController do

  describe "GET 'handle404'" do
    it "should be successful" do
      get 'handle404'
      response.should be_success
    end
  end

end
