
require 'spec_helper'

describe "User" do
  
  describe "create_new", :neo4j => true do
    it "will create a new user and return it" do
      user = {:first_name => 'mark', :last_name => 'nijhof'}
      new_user = User.create_new user

      new_user.first_name.should == 'mark'
      new_user.last_name.should == 'nijhof'
      new_user.node_type.should == 'user'
    end

    it "will create a new user in the data store when called" do
      user = {:first_name => 'mark', :last_name => 'nijhof'}
      new_user = User.create_new user

      neo_user = Neography::Node.load(new_user.neo_id)

      neo_user.first_name.should == 'mark'
      neo_user.last_name.should == 'nijhof'
      neo_user.node_type.should == 'user'
    end

    it "will be able to load a previously created user from the data store" do
      user = {:first_name => 'mark', :last_name => 'nijhof'}
      new_user = User.create_new user

      neo_user = User.get(new_user.neo_id)

      neo_user.first_name.should == 'mark'
      neo_user.last_name.should == 'nijhof'
      neo_user.node_type.should == 'user'
    end

    it "will create an authentication provider and relate them to the created user when provided" do
      user = {:first_name => 'mark', :last_name => 'nijhof'}
      authentication_provider = {:provider_name => 'LinkedIn'}
      new_user = User.create_new user, authentication_provider

      authentication_providers = User.get_authentication_providers(new_user.neo_id)

      authentication_providers.first.provider_name.should == 'LinkedIn'
    end

    it "will add an authentication provider and relate them to an existing user" do
      user = {:first_name => 'mark', :last_name => 'nijhof'}
      authentication_provider_1 = {:provider_name => 'LinkedIn'}
      authentication_provider_2 = {:provider_name => 'Twitter'}
      new_user = User.create_new user, authentication_provider_1
      User.add_authentication_provider new_user.neo_id, authentication_provider_2

      authentication_providers = User.get_authentication_providers(new_user.neo_id)

      authentication_providers[1].provider_name.should == 'Twitter'
    end

    it "will be able to get authentication providers from an user filtered by name" do
      user = {:first_name => 'mark', :last_name => 'nijhof'}
      authentication_provider_1 = {:provider_name => 'LinkedIn'}
      authentication_provider_2 = {:provider_name => 'Twitter'}
      new_user = User.create_new user, authentication_provider_1
      User.add_authentication_provider new_user.neo_id, authentication_provider_2

      authentication_providers = User.get_authentication_providers(new_user.neo_id, 'Twitter')

      authentication_providers.first.provider_name.should == 'Twitter'
    end
  end
end