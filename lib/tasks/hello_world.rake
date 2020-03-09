require './lib/message_responder'
require './lib/app_configurator'

config = AppConfigurator.new
logger = config.get_logger

desc 'Say hello!'
task :hello_world do
  puts "Hello"
  logger.debug 'Starting telegram bot'
end