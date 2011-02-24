require 'linkedin'

module Authentication
  class LinkedinController < ApplicationController
    layout nil
    
    def index
      # client = LinkedIn::Client.new(ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'])
      # request_token = client.request_token(:oauth_callback => "#{url_for(:controller => :linkedin, :action => :callback)}")
      #     
      # session[:initiating_url] = "#{(params[:url] ||= "")}/"
      # session[:rtoken] = request_token.token
      # session[:rsecret] = request_token.secret
      # redirect_to request_token.authorize_url
    end

    def callback
      # oauth_token = params[:oauth_token]
      # oauth_verifier = params[:oauth_verifier]
      # 
      # client = LinkedIn::Client.new(ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'])
      # token, secret = client.authorize_from_request session[:rtoken], session[:rsecret], oauth_verifier
      # 
      # linked_in_profile = client.profile(:fields => [
      #   :id, 
      #   :first_name, 
      #   :last_name, 
      # ])
      # 
      # invite_code       = session[:invite_code]
      # user_id           = session[:user_id]
      # unique_identifier = linked_in_profile.id
      # email             = ''
      # open_id_name      = "#{linked_in_profile.first_name} #{linked_in_profile.last_name}"
      # 
      # user_information = {
      #   :user_id => session[:user_id], 
      #   :email => email, 
      #   :open_id_name => "#{linked_in_profile.first_name} #{linked_in_profile.last_name}", 
      #   :first_name => linked_in_profile.first_name, 
      #   :last_name => linked_in_profile.last_name, 
      #   :provider_id => linked_in_profile.id, 
      #   :provider_name => "LinkedIn", 
      #   :oauth_token => token, 
      #   :oauth_token_secret => secret
      # }
      # 
      # user = Authentication::UserHelper::UserManager.new.get_create_or_merge_user user_information
      # 
      # session[:user_id] = user.id
      # session[:invite_code] = nil
      # 
      # session[:rtoken] = nil
      # session[:rsecret] = nil
      # 
      # redirect_to url_for :controller => :authentication, :action => :after_authentication
    end

  end
end
