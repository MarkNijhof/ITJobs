require 'linkedin'

module Authentication
  class LinkedinController < ApplicationController
    layout nil
    
    def index
      client = LinkedIn::Client.new(ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'])
      request_token = client.request_token(:oauth_callback => "#{url_for(:controller => :linkedin, :action => :callback)}")
          
      session[:initiating_url] = "#{(params[:url] ||= "")}/"
      session[:rtoken] = request_token.token
      session[:rsecret] = request_token.secret
      redirect_to request_token.authorize_url
    end

    def callback
      oauth_token = params[:oauth_token]
      oauth_verifier = params[:oauth_verifier]

      client = LinkedIn::Client.new(ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'])
      token, secret = client.authorize_from_request session[:rtoken], session[:rsecret], oauth_verifier

      linked_in_profile = client.profile(:fields => [
        :id, 
        :first_name, 
        :last_name, 
      ])

      invite_code       = session[:invite_code]
      user_id           = session[:user_id]
      unique_identifier = linked_in_profile.id
      email             = ''
      open_id_name      = "#{linked_in_profile.first_name} #{linked_in_profile.last_name}"

  #    person = AuthenticationModels::Person.get_create_or_merge invite_code, user_id, unique_identifier, email

  #    person.open_id_ids << unique_identifier if !person.open_id_ids.include?(unique_identifier)
  #    person.open_id_names << open_id_name if !open_id_name.nil? && !person.open_id_names.include?(open_id_name)
  ##    person.email_addresses << email if !email.nil? && !person.email_addresses.include?(email)
  #    person.photo_urls << linked_in_profile.picture_url if !linked_in_profile.picture_url.nil? && !person.photo_urls.include?(linked_in_profile.picture_url)

  #    person.first_name = linked_in_profile.first_name
  #    person.last_name = linked_in_profile.last_name
  #    person.openid_name = open_id_name

  #    openid_provider = person.OpenidProviders.select{|item| item.provider_name == 'LinkedIn' && item.open_id_id == unique_identifier}.first
  #    if openid_provider.nil?
  #      openid_provider = AuthenticationModels::OpenidProvider.new
  #      openid_provider.provider_name = 'LinkedIn'
  #      openid_provider.open_id_id = unique_identifier
  #      person.OpenidProviders << openid_provider
  #    end

  #    openid_provider.oauth_type = 'OAuth'
  #    #LinkedIn type=OAuth
  #    openid_provider.oauth_token = token
  #    openid_provider.oauth_token_secret = secret
  #    #Facebook type=Facebook
  #    # openid_provider.uid = unique_identifier
  #    # openid_provider.session_key = json['accessCredentials']['sessionKey'] ||= ''
  #    # openid_provider.expires = json['accessCredentials']['expires'] ||= ''
  #    #WindowsLive type=WindowsLive
  #    # openid_provider.eact = json['accessCredentials']['eact'] ||= ''

  #    openid_provider.save
  #    person.save

      session[:user_id] = unique_identifier #person.id
      session[:invite_code] = nil

      session[:rtoken] = nil
      session[:rsecret] = nil

      redirect_to url_for :controller => :authentication, :action => :after_authentication
    end

  end
end
