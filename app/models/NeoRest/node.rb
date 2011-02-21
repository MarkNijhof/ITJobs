require 'json'
require 'rest-client'
require 'ostruct'

module NeoRest

  class Node < OpenStruct
  
    attr_reader :neo_id, :neo_url
  
    def initialize( hash = nil )
      @table = {}
      if hash
        @neo_id = hash["self"].split('/').last
        @neo_url = hash["self"]

        for key, value in hash["data"]
          @table[key.to_sym] = value
          new_ostruct_member(key)
        end
      end
    end
    
    def update properties = {}
      if not properties.empty?
        @table.each { | key, value | delete_field( key ) }
        @table.clear
        
        for key, value in properties
          @table[key.to_sym] = value
          new_ostruct_member(key)
        end
      end
            
      RestClient.put( "#{$base_url}/node/#{neo_id}/properties", @table.to_json, :content_type => :json, :accept => :json )
    end
    
    def delete
      NeoRest::Node.delete neo_id
    end

    def get_relationships direction = :all
      relationsships_json = JSON.parse( RestClient.get( "#{$base_url}/node/#{neo_id}/relationships/#{direction}", :accept => :json ) )
      relationsships = []
      relationsships_json.each { | relationship | relationsships << NeoRest::Relationship.new( relationship ) }
      return relationsships unless block_given?
      relationsships.each { | relationship | yield relationship }
    end
    
    def add_relationship_to node, type, meta_data = {}
      NeoRest::Relationship.new( JSON.parse( RestClient.post( "#{$base_url}/node/#{neo_id}/relationships", { :to => "#{$base}/node/#{node.neo_id}", :type => type, :data => meta_data }.to_json, :content_type => :json, :accept => :json ) ) )
    end
  
    class << self
    
      def create_new node_data
        NeoRest::Node.new( JSON.parse( RestClient.post( "#{$base_url}/node", node_data.to_json, :content_type => :json, :accept => :json ) ) )
      end

      def load node_id
        RestClient.get( "#{$base_url}/node/#{node_id}", :accept => :json ){ |response, request, result, &block|
          case response.code
            when 200
              NeoRest::Node.new( JSON.parse( response ) )
            when 404
              return nil
            else
              response.return!(request, result, &block)
          end
        }
      end
      
      def delete node_id
        RestClient.delete( "#{$base_url}/node/#{node_id}" )
      end
    
    end
  end

end