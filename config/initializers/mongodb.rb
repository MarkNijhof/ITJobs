# include MongoMapper
# 
# host = ENV['MONGODB_HOST']
# port = ENV['MONGODB_PORT']
# database = ENV['MONGODB_DATABASE']
# username = ENV['MONGODB_USER_NAME']
# password = ENV['MONGODB_PASSWORD']
# 
# MongoMapper.connection = Mongo::Connection.new(host || 'localhost',
#                                                port || 27017,
#                                               :logger => Rails.logger)
# 
# MongoMapper.database = database
# 
# if username && password
#   MongoMapper.database.authenticate(username, password)
# end
# 
# #ActionController::Base.rescue_responses['MongoMapper::DocumentNotFound'] = :not_found
