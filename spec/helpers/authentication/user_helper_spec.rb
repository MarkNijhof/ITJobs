require 'spec_helper'

describe "Authentication::UserHelper::UserManager", :neo4j => true do
  
  describe "get_create_or_merge_user" do
    it "will return a fully initialized and saved person after a user logs in with a provider for the first time" do
      user_manager = Authentication::UserHelper::UserManager.new

      user_information = {
#        :user_id => "12345", 
        :email => "mark.nijhof@gmail.com", 
        :open_id_name => "Mark Nijhof", 
        :first_name => "Mark", 
        :last_name => "Nijhof", 
        :provider_id => "12345", 
        :provider_name => "LinkedIn", 
        :oauth_token => "some_token", 
        :oauth_token_secret => "some_secret"        
      }
      
      user = user_manager.get_create_or_merge_user user_information
      
      User.all.count.should == 1
      user.get_user_name.should == "Mark Nijhof"
      user.first_name.should == "Mark"
      user.last_name.should == "Nijhof"
      user.email_address.should == "mark.nijhof@gmail.com"
      user.provider_ids.should =~ ["12345"]
      user.provider_names.should =~ ["LinkedIn"]
      user.email_addresses.should =~ ["mark.nijhof@gmail.com"]
      
      authentication_providers = User.get_authentication_providers(user.neo_id)
      authentication_providers.count.should == 1
      
      # user.AuthenticationProviders.count.should == 1
      ap = authentication_providers[0]
      ap.id.should == "12345"
      ap.provider_name.should == "LinkedIn"
      ap.oauth_token.should == "some_token"
      ap.oauth_token_secret.should == "some_secret"

    end
  end

  describe "get_create_or_merge_user" do
    it "will return a fully initialized person retrieving it from the database after a user logs in with a provider a second time" do
      user_manager = Authentication::UserHelper::UserManager.new

      user_information = {
#        :user_id => "12345", 
        :email => "mark.nijhof@gmail.com", 
        :open_id_name => "Mark Nijhof", 
        :first_name => "Mark", 
        :last_name => "Nijhof", 
        :provider_id => "12345", 
        :provider_name => "LinkedIn", 
        :oauth_token => "some_token", 
        :oauth_token_secret => "some_secret"        
      }
      
      user_manager.get_create_or_merge_user user_information

      user_information[:oauth_token] = "some_other_token"
      user_information[:oauth_token_secret] = "some_other_secret"

      user = user_manager.get_create_or_merge_user user_information
      
      User.all.count.should == 1
      user.get_user_name.should == "Mark Nijhof"
      user.first_name.should == "Mark"
      user.last_name.should == "Nijhof"
      user.email_address.should == "mark.nijhof@gmail.com"
      user.provider_ids.should =~ ["12345"]
      user.provider_names.should =~ ["LinkedIn"]
      user.email_addresses.should =~ ["mark.nijhof@gmail.com"]
      
      user.AuthenticationProviders.count.should == 1
      ap = user.AuthenticationProviders[0]
      ap.id.should == "12345"
      ap.provider_name.should == "LinkedIn"
      ap.oauth_token.should == "some_other_token"
      ap.oauth_token_secret.should == "some_other_secret"

    end
  end

  describe "get_create_or_merge_user" do
    it "will return a fully initialized person retrieving it from the database after a user logs in with a different provider in the same session" do
      user_manager = Authentication::UserHelper::UserManager.new

      user_information = {
#        :user_id => "12345", 
        :email => "mark.nijhof@gmail.com", 
        :open_id_name => "Mark Nijhof", 
        :first_name => "Mark", 
        :last_name => "Nijhof", 
        :provider_id => "12345", 
        :provider_name => "LinkedIn", 
        :oauth_token => "some_token", 
        :oauth_token_secret => "some_secret"        
      }

      first_user = user_manager.get_create_or_merge_user user_information

      user_information[:user_id] = first_user.id
      user_information[:email] = "mark.nijhof@cre8ivethought.com"
      user_information[:provider_id] = "54321"
      user_information[:provider_name] = "Facebook"
      user_information[:oauth_token] = "some_other_token"
      user_information[:oauth_token_secret] = "some_other_secret"

      user = user_manager.get_create_or_merge_user user_information

      User.all.count.should == 1
      user.get_user_name.should == "Mark Nijhof"
      user.first_name.should == "Mark"
      user.last_name.should == "Nijhof"
      user.email_address.should == "mark.nijhof@gmail.com"
      user.provider_ids.should =~ ["12345", "54321"]
      user.provider_names.should =~ ["LinkedIn", "Facebook"]
      user.email_addresses.should =~ ["mark.nijhof@gmail.com", "mark.nijhof@cre8ivethought.com"]

      user.AuthenticationProviders.count.should == 2
      ap = user.AuthenticationProviders[0]
      ap.id.should == "12345"
      ap.provider_name.should == "LinkedIn"
      ap.oauth_token.should == "some_token"
      ap.oauth_token_secret.should == "some_secret"

      ap = user.AuthenticationProviders[1]
      ap.id.should == "54321"
      ap.provider_name.should == "Facebook"
      ap.oauth_token.should == "some_other_token"
      ap.oauth_token_secret.should == "some_other_secret"

    end
  end

end
