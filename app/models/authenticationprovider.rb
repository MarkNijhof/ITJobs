class AuthenticationProvider
  include MongoMapper::EmbeddedDocument
  plugin MongoMapper::Plugins::Timestamps
  
  belongs_to :user

  key :provider_name
  key :id
  key :token
  key :oauth_type
  #LinkedIn type=OAuth
  key :oauth_token
  key :oauth_token_secret
  #Facebook type=Facebook
  key :uid
  key :session_key
  key :expires

end