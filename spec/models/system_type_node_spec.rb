# 
# require 'spec_helper'
# 
# describe "SystemTypeNode" do
#   
#   describe "get_or_create_new", :neo4j => true do
#     it "will create a new system type node and return it" do
# 
#       new_system_type_node = SystemTypeNode.get_or_create_new 'new_type_to_be_created'
# 
#       new_system_type_node.name.should == 'new_type_to_be_created'
#       new_system_type_node.node_type.should == 'systemtypenode'
#     end
#   end
#   
#   describe "get_or_create_new", :neo4j => true do
#     it "will get a system type node if it exists and return it" do
# 
#       new_system_type_node_1 = SystemTypeNode.get_or_create_new 'new_type_to_be_created'
# 
#       new_system_type_node_2 = SystemTypeNode.get_or_create_new 'new_type_to_be_created'
# 
#       new_system_type_node_1.name.should == 'new_type_to_be_created'
#       new_system_type_node_1.node_type.should == 'systemtypenode'
#       new_system_type_node_1.neo_id.should == new_system_type_node_2.neo_id
#     end
#   end
#   
#   describe "get_or_create_new", :neo4j => true do
#     it "will add the newly created system type node to the system types index" do
# 
#       new_system_type_node = SystemTypeNode.get_or_create_new 'new_type_to_be_created'
# 
#       neo = Neography::Rest.new
#       nodes = neo.get_node_index('system_types_index', 'name', 'new_type_to_be_created')
#       nodes.count.should == 1
#       nodes[0][:data].name.should == 'new_type_to_be_created'
#     end
#   end
# end