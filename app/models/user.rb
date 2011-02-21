# require 'neography'

class User
  
  class << self
    def create_new data, authentication_provider_data = nil
      # data[:node_type] = self.name.downcase
      # entity = Neography::Node.create(data)
      # if not authentication_provider_data.nil?
      #   authentication_provider = AuthenticationProvider.create_new authentication_provider_data
      #   entity.outgoing(:authentication_providers) << authentication_provider
      # end
      # 
      # entity
      nil
    end
    
    def get id
      # Neography::Node.load(id)
    end
    
    def add_authentication_provider id, authentication_provider_data
      # entity = get id
      # authentication_provider = AuthenticationProvider.create_new authentication_provider_data
      # entity.outgoing(:authentication_providers) << authentication_provider
      # authentication_provider
      nil
    end
    
    def get_authentication_providers id, provider_name = nil
      # entity = get id
      # return entity.outgoing(:authentication_providers).filter("position.endNode().hasProperty('provider_name') && position.endNode().getProperty('provider_name')=='#{provider_name}';") unless provider_name.nil?
      # entity.outgoing(:authentication_providers)
      nil
    end
    
  end
end