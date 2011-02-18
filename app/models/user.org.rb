# class User
#   include MongoMapper::Document
#   plugin MongoMapper::Plugins::Timestamps
#   
#   key :first_name
#   key :last_name
#   key :friendly_name
#   key :openid_name
# 
#   key :address
#   key :postal_code
#   key :city
#   
#   key :email_address
# 
#   key :provider_ids, Array
#   key :provider_names, Array
#   key :email_addresses, Array
#   
#   key :is_employer, Boolean
# 
#   many :AuthenticationProviders
# 
#   def get_user_name
#     friendly_name.nil? || friendly_name == "" ? openid_name : friendly_name
#   end
#   
#   def self.find_using_session_id session_id
#     begin
#       User.find session_id
#     rescue
#       
#     end
# 
#   end
# end