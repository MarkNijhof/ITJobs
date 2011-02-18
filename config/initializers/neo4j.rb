include Neography

host = ENV['NEO4J_HOST']
directory = ENV['NEO4J_DIRECTORY']
username = ENV['NEO4J_USER_NAME']
password = ENV['NEO4J_PASSWORD']

Neography::Config.server = host
Neography::Config.directory = "/#{directory}" unless directory.nil? || directory == ''
Neography::Config.username = username unless username.nil? || username == ''
Neography::Config.password = password unless password.nil? || password == ''

puts "Neo4j Initialized"