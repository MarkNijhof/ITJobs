require 'spec_helper'

describe AuthenticateController do

  describe "GET 'linkedin'" do
    it "should be successful" do
      get 'linkedin'
      response.should be_success
    end
  end

  describe "GET 'facebook'" do
    it "should be successful" do
      get 'facebook'
      response.should be_success
    end
  end

  describe "GET 'twitter'" do
    it "should be successful" do
      get 'twitter'
      response.should be_success
    end
  end

  describe "GET 'google'" do
    it "should be successful" do
      get 'google'
      response.should be_success
    end
  end

  describe "GET 'openid'" do
    it "should be successful" do
      get 'openid'
      response.should be_success
    end
  end

  describe "GET 'itjobs'" do
    it "should be successful" do
      get 'itjobs'
      response.should be_success
    end
  end

end
