require 'rubygems'
require 'bundler/setup'

require 'pg'
require 'active_record'
require 'yaml'

require 'pry'

require './lib/app_configurator'
require './lib/message_responder'

@mess = MessageResponder.hi

@config = AppConfigurator.new
@config.configure

@token = @config.get_token
@logger = @config.get_logger

require 'telegram/bot'

# start a REPL session


namespace :task do
  desc "Hello job"
  task :newjob do
    puts "Hello new job"
    @logger.debug 'Starting telegram bot!!!'
    @mess

    # options = {bot: bot, message: message}
    # @logger.debug "@#{message.from.username}: #{message.text}"
    # MessageResponder.new(options).respond
    # binding.pry

    # MessageResponder.start

    # logger.info "blah"
    # command "echo 'you can use raw cron syntax too'"
    # logger.debug 'Starting telegram bot'
  end
end

namespace :db do
  desc 'Migrate the database'
  task :migrate do
    connection_details = YAML::load(File.open('config/database.yml'))

    ActiveRecord::Base.establish_connection(connection_details)
    # ActiveRecord::Migration.change('db/migrate/')
    ActiveRecord::MigrationContext.new("db/migrate/").migrate
  end

  desc 'Create the database'
  task :create do
    connection_details = YAML::load(File.open('config/database.yml'))
    admin_connection = connection_details.merge({'database'=> 'postgres',
                                                'schema_search_path'=> 'public'})
    ActiveRecord::Base.establish_connection(admin_connection)
    ActiveRecord::Base.connection.create_database(connection_details.fetch('database'))
  end

  desc 'Drop the database'
  task :drop do
    connection_details = YAML::load(File.open('config/database.yml'))
    admin_connection = connection_details.merge({'database'=> 'postgres',
                                                'schema_search_path'=> 'public'})
    ActiveRecord::Base.establish_connection(admin_connection)
    ActiveRecord::Base.connection.drop_database(connection_details.fetch('database'))
  end
end
