
module NeoRest
  
  class Config
    class << self
      def init 
        $base_url = 'http://localhost:7474/db/data'
      end
    end
  end
end