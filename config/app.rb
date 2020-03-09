# config/app.rb
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: '5',
  timeout: '5000',
  database: 'bot_test'
)
