require 'data_mapper'


env = ENV['RACK_ENV'] || 'development'

# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, "postgres://tdnfxwxttnxxut:KAHm7BKyOSw1mWPabNJziJbrAm@ec2-54-225-134-223.compute-1.amazonaws.com:5432/d58drv5057d000)

require './app/models/link' # require each model individually - the path may vary depending on your file structure.

# After declaring your models, you should finalise them
DataMapper.finalize
# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!
