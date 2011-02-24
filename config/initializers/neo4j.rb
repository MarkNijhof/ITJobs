
host = ENV['NEO4J_HOST']
port = ENV['NEO4J_PORT']
directory = ENV['NEO4J_DIRECTORY']
username = ENV['NEO4J_USER_NAME']
password = ENV['NEO4J_PASSWORD']

NeoRest::Config.init

puts "Neo4j Initialized"