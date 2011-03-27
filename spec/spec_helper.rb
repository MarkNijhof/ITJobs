# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rake'

# include RSpec::Matchers

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec
  
  config.before(:each, :neo4j => true) do
    NeoRest::TestHelper.clean_the_whole_database 'yeah_delete_it_all'
    
    
    # puts "Neo4j Before Filter"
    # sh "~/neo4j-server/bin/neo4j stop"
    # sh "rm -rf ~/neo4j-server/data/graph.db"
    # sh "~/neo4j-server/bin/neo4j start"
    # sleep 2
    
#    neo = Neography::Rest.new 
#    nodes = neo.get_nodes()
#    nodes.each do |node| 
#      relations = neo.get_node_relationships node
#      relations.each { |relation| neo.delete_relationship relation }
#      neo.delete_node node
#    end
  end
end

