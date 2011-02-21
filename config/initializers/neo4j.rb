# include Neography

host = ENV['NEO4J_HOST']
port = ENV['NEO4J_PORT']
directory = ENV['NEO4J_DIRECTORY']
username = ENV['NEO4J_USER_NAME']
password = ENV['NEO4J_PASSWORD']

# Neography::Config.server = host
# Neography::Config.port = port
# Neography::Config.directory = "/#{directory}" unless directory.nil? || directory == ''
# Neography::Config.username = username unless username.nil? || username == ''
# Neography::Config.password = password unless password.nil? || password == ''

NeoRest::Config.init

puts "Neo4j Initialized"