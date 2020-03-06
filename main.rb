require 'active_record'
# require 'pg' # postgresql

# require_relative './models/user.rb'

# def db_configuration
#    db_configuration_file = File.join(File.expand_path('..', __FILE__), 'db', 'config.yml')
#    YAML.load(File.read(db_configuration_file))
# end
 
# ActiveRecord::Base.establish_connection(db_configuration["development"])

ActiveRecord::Base.establish_connection(
   adapter: 'postgresql',
   encoding: 'unicode',
   pool: '5',
   timeout: '5000',
   database: 'bot_dev'
 )

 class User < ActiveRecord::Base
 end

# Get first user
p "FUCK DB"

p first_user = User.last
p first_user.name
p first_user.email 

 
# print "Give me the name: "
# name = "Name"

# print "Give me your email: "
# email = "email"
 
# User.find_or_create_by(
#             name: "n222aaaame", 
#             email: "emasssss222il"
#            )

 
# puts "Number of movies in your database: #{User.count}"
# puts "Bye!"