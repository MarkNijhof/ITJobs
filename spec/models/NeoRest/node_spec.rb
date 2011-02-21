
require 'spec_helper'

describe "NeoRest::Node" do
  
  describe "create_new", :neo4j => true do

    it "will create a new node and return it as json" do
      new_node = NeoRest::Node.create_new( {:name => 'node name', :other_property => 'property value'} )
      new_node.name.should == 'node name'
      new_node.other_property.should == 'property value'
    end

  end

  describe "load", :neo4j => true do

    it "will load an existing node and return it as json" do
      new_node = NeoRest::Node.create_new( {:name => 'node name', :other_property => 'property value'} )

      existing_node = NeoRest::Node.load( new_node.neo_id )
      existing_node.name.should == 'node name'
      existing_node.other_property.should == 'property value'
    end

  end

  describe "add_relations", :neo4j => true do

    it "will add a relationships to a node" do
      new_node_1 = NeoRest::Node.create_new( {:name => 'node name 1', :other_property => 'property value'} )
      new_node_2 = NeoRest::Node.create_new( {:name => 'node name 2', :other_property => 'property value'} )

      relationship = new_node_1.add_relationship_to new_node_2, :knows
      relationship.start_id.should == new_node_1.neo_id
      relationship.end_id.should == new_node_2.neo_id
      relationship.type.should == "knows"
    end

    it "will add a relationships with meta data to a node" do
      new_node_1 = NeoRest::Node.create_new( {:name => 'node name 1', :other_property => 'property value'} )
      new_node_2 = NeoRest::Node.create_new( {:name => 'node name 2', :other_property => 'property value'} )

      relationship = new_node_1.add_relationship_to new_node_2, :knows, {:name => 'relation one', :description => 'description one'}
      relationship.name.should == "relation one"
      relationship.description.should == "description one"
    end

  end

  describe "get_relationships", :neo4j => true do

    it "will load all existing relations of a node and return it as json" do
      new_node_1 = NeoRest::Node.create_new( {:name => 'node name 1', :other_property => 'property value'} )
      new_node_2 = NeoRest::Node.create_new( {:name => 'node name 2', :other_property => 'property value'} )

      relationship_1 = new_node_1.add_relationship_to new_node_2, :knows
      relationship_2 = new_node_1.add_relationship_to new_node_2, :knows, {:name => 'relation one', :description => 'description one'}
      
      relationships_1 = new_node_1.get_relationships
      relationships_1.count.should == 2
      relationships_1[1].name.should == 'relation one'
    end

  end

  describe "update", :neo4j => true do

    it "will update an existing node" do
      new_node = NeoRest::Node.create_new( {:name => 'node name', :other_property => 'property value'} )

      new_node.name = 'new node name'
      new_node.other_property = 'new property value'
      new_node.update

      existing_node = NeoRest::Node.load( new_node.neo_id )
      existing_node.name.should == 'new node name'
      existing_node.other_property.should == 'new property value'
    end

    it "will update an existing node with a hash" do
      new_node = NeoRest::Node.create_new( {:name => 'node name', :other_property => 'property value'} )

      new_node.update( {:name => 'new node name', :other_property => 'new property value', :new_property => 'value'} )

      new_node.name.should == 'new node name'
      new_node.other_property.should == 'new property value'
      new_node.new_property.should == 'value'

      existing_node = NeoRest::Node.load( new_node.neo_id )
      existing_node.name.should == 'new node name'
      existing_node.other_property.should == 'new property value'
      existing_node.new_property.should == 'value'
    end

  end
  
  describe "delete", :neo4j => true do

    it "will delete an existing node that is loaded" do
      new_node = NeoRest::Node.create_new( {:name => 'node name', :other_property => 'property value'} )

      new_node.delete

      existing_node = NeoRest::Node.load( new_node.neo_id )
      existing_node.nil?.should == true
    end

    it "will delete an existing node" do
      new_node = NeoRest::Node.create_new( {:name => 'node name', :other_property => 'property value'} )

      NeoRest::Node.delete new_node.neo_id

      existing_node = NeoRest::Node.load( new_node.neo_id )
      existing_node.nil?.should == true
    end

  end

end