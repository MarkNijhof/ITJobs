
module Authentication::UserHelper
  class UserManager
    
    def get_create_or_merge_user user_information

      user = retrieve_and_update_existing_user_with_additional_provider user_information
      return user unless user.nil?

      user = retrieve_and_update_existing_user user_information
      return user unless user.nil?
      
      create_new_user user_information

    end

    private
    
    def retrieve_and_update_existing_user_with_additional_provider user_information
      
      user = User.find_using_session_id(user_information[:user_id])

      if !user.nil? 
        user.email_address = user_information[:email] if user.email_address == ""
        user.email_addresses << user_information[:email] unless user_information[:email] == "" || user.email_addresses.include?(user_information[:email])

        user.first_name = user_information[:first_name] if user.first_name == ""
        user.last_name = user_information[:last_name] if user.last_name == ""
        user.openid_name = user_information[:open_id_name] if user.openid_name == ""

        user.provider_ids << user_information[:provider_id] unless user.provider_ids.include?(user_information[:provider_id])
        user.provider_names << user_information[:provider_name] unless user.provider_names.include?(user_information[:provider_name])

        if user.AuthenticationProviders.select{|item| item.id == user_information[:provider_id]}.first.nil?
          authentication_provider = create_authentication_provider user_information
          user.AuthenticationProviders << authentication_provider
          authentication_provider.save
        end
        user.save
      end
      
      user
    end

    def retrieve_and_update_existing_user user_information      
      
      user = User.first("AuthenticationProviders.id" => user_information[:provider_id])
            
      if !user.nil? 
        authentication_provider = user.AuthenticationProviders.select{|item| item.id == user_information[:provider_id]}.first
        authentication_provider.oauth_token = user_information[:oauth_token]
        authentication_provider.oauth_token_secret = user_information[:oauth_token_secret]
        authentication_provider.save
      end
      
      user
    end

    def create_new_user user_information
      new_user = User.new
      new_user.provider_ids = Array.new
      new_user.provider_names = Array.new
      new_user.email_addresses = Array.new
      
      new_user.email_address = user_information[:email]
      new_user.email_addresses << user_information[:email] unless user_information[:email] == ""

      new_user.first_name = user_information[:first_name]
      new_user.last_name = user_information[:last_name]
      new_user.openid_name = user_information[:open_id_name]
      
      new_user.provider_ids << user_information[:provider_id]
      new_user.provider_names << user_information[:provider_name]
      
      authentication_provider = create_authentication_provider user_information
      new_user.AuthenticationProviders << authentication_provider
      authentication_provider.save

      new_user.save

      new_user
    end
    
    def create_authentication_provider user_information
      authentication_provider = AuthenticationProvider.new
      authentication_provider.id = user_information[:provider_id]
      authentication_provider.provider_name = user_information[:provider_name]
      authentication_provider.oauth_token = user_information[:oauth_token]
      authentication_provider.oauth_token_secret = user_information[:oauth_token_secret]
      
      authentication_provider
    end

  end
end