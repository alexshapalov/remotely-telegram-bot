require 'telegram/bot'
require './lib/message_responder'
require './lib/app_configurator'

config = AppConfigurator.new
config.configure

token = config.get_token
logger = config.get_logger

logger.debug 'Starting telegram bot'

desc 'Say hello!'
task :hello_world do
  logger.debug 'Starting telegram bot'

  Telegram::Bot::Client.run(token) do |bot|
    bot.api.send_message(chat_id: 976695134, text: "new job for ruby")
  end
end