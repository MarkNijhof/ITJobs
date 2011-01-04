require 'linkedin'

module Authentication
  class AuthenticationController < ApplicationController
    layout nil

  #  get :login, :map => '/login', :with => [:user_id] do |user_id|
  #    if Padrino.env == :test
  #      session[:user_id] = user_id
  #    end
  #    
  #    return ''
  #  end
    
    def after_authentication
      @initiating_url = request.scheme + '://' + request.host_with_port + session[:initiating_url]
      session[:initiating_url] = nil
      render :'authentication/after_authentication'
    end

    def logout
      session[:user_id] = nil
      redirect_to "/"
    end
    
  #  def login_failed(/*url)
  #    redirect "/#{params[:url]}"
  #  end
      
  #  get :got_invited, :map => '/i_have_an_invite_code/', :with => :invite_code do |invite_code|
  #    session[:invite_code] = invite_code
  #    redirect '/'
  #  end
    
  #  get :create_invite_code, :map => '/create_invite_code/', :with => [:first_name, :last_name, :email_address] do |first_name, last_name, email_address|
  #    begin
  #      person = AuthenticationModels::Person.create_invite first_name, last_name, email_address
  #      url_for(:got_invited, :invite_code => person.id)
  #    rescue Exception => ex
  #      ex.message
  #    end
  #  end  

  end
end
