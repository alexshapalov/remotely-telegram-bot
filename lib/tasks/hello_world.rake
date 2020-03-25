# require 'pry'
require 'telegram/bot'
require 'active_record'
# require './lib/message_sender'

# ActiveRecord::Base.establish_connection(
#   adapter: 'postgresql',
#   encoding: 'unicode',
#   pool: '5',
#   timeout: '5000',
#   database: 'remotelyapp_dev' 
# )

# class User < ActiveRecord::Base
# end

# class Job < ActiveRecord::Base
#   connects_to database: { reading: :jobs }
# end

desc 'Say hello!'
task :hello_world => :environment do
  token = "568713603:AAEvl-GsiSsmxbkF18CdiG16nG3-fcsFRXA"
  # user = User.where(id: 31)

  job = User.last
  # p job.position 

  Telegram::Bot::Client.run(token) do |bot|
    bot.api.send_message(chat_id: 140026745, text: "#{job}")
  end
end


# desc 'Say hello!'
# task :hello_world do
#   Telegram::Bot::Client.run(token) do |bot|
#     bot.listen do |message|
#       case message.text
#       when '/start'
#         bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")

#         answer_with_message I18n.t('greeting_message_3')
#         sleep 2

#         @user = User.find_or_create_by(chat_id: message.from.id)
#         @user.first_name = message.from.first_name,
#         @user.last_name = message.from.last_name,
#         @user.username = message.from.username,
#         @user.email = message.text
#         @user.save

#       when '/stop'
#         bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
#       end
#     end
#   end
# end
