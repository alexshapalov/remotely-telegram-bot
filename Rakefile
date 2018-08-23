require 'rubygems'
require 'bundler/setup'

require 'pg'
require 'active_record'
require 'yaml'

# desc 'Migrate the database'
# task :up => :'db:connect' do
#   migrations = if ActiveRecord.version.version >= '5.2'
#     ActiveRecord::Migration.new.migration_context.migrations
#   else
#     ActiveRecord::Migrator.migrations('db/migrate')
#   end
#   ActiveRecord::Migrator.new(:up, migrations, nil).migrate
# end


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
