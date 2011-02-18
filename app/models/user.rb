require 'neography'

class User
  
  class << self
    def create_new data, authentication_provider_data = nil
      data[:node_type] = self.name.downcase
      entity = Neography::Node.create(data)
      if not authentication_provider_data.nil?
        authentication_provider = AuthenticationProvider.create_new authentication_provider_data
        entity.outgoing(:authentication_providers) << authentication_provider
        #Neography::Relationship.create(:authentication_providers, entity, authentication_provider)
      end

      entity
    end
    
    def get id
      Neography::Node.load(id)
    end
    
    def add_authentication_provider id, authentication_provider_data
      entity = get id
      authentication_provider = AuthenticationProvider.create_new authentication_provider_data
      entity.outgoing(:authentication_providers) << authentication_provider
      #Neography::Relationship.create(:authentication_providers, entity, authentication_provider)
      authentication_provider
    end
    
    def get_authentication_providers id, provider_name = nil
      entity = get id
#      entity.outgoing(:authentication_providers).filter("position.startNode().hasProperty('provider_name') && position.startNode().getProperty('provider_name')=='#{name}';") and return unless provider_name.nil?
      entity.outgoing(:authentication_providers).filter("position.node().getProperty('provider_name')=='#{provider_name}';") and return unless provider_name.nil?
      entity.outgoing(:authentication_providers)
    end
    
  end
end