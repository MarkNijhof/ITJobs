# require 'neography'

class SystemTypeNode
  
  class << self
    
    def get_or_create_new name_of_system_type_node
      # 
      # nodes = Neography::Rest.new.get_node_index('system_types_index', 'name', name_of_system_type_node)
      # return nodes[0].data unless nodes.nil? || nodes.count == 0
      # 
      # entity = Neography::Node.create({:name => name_of_system_type_node, :node_type => self.name.downcase})
      # neo = Neography::Rest.new
      # neo.add_node_to_index('system_types_index', 'name', name_of_system_type_node, entity)
      # entity
      nil
    end
    
  end
end