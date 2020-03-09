require 'active_record'

# require './models/user'
require './lib/message_sender'
# require './lib/message_recruter'
# require './lib/message_talent'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: '5',
  timeout: '5000',
  database: 'bot_dev'
)

class User < ActiveRecord::Base
end

class MessageResponder

  attr_reader :message
  attr_reader :bot
  attr_reader :user

  def initialize(options)
    @bot = options[:bot]
    @message = options[:message]
    # @user = User.find_or_create_by(uid: message.from.id)
  end

  def self.hi
    p "Hello from lib/message_sender"
  end

  def respond
    on /^\/start/ do
      answer_with_greeting_message
    end

    on /^\/yes/ do      
      answer_with_yes_message
      
      #logger.debug "sending '#{text}' to #{chat.username}"
      # email = message.text
      # logger.debug "#{message.text}"
      # logger.debug "#{message}"
      # logger.debug "#{options[:message]}"
      # logger.debug "#{message.chat}"


      # User.find_or_create_by(
      #             name: message.text, 
      #             email: message.chat
      #           )

      # if @user.email?
      #   starting_profile_current_position
      #   @user.position = message.text
      # end
    end

    on /^\/new/ do
      answer_with_new_vacation
    end

    on /^\/stop/ do
      answer_with_farewell_message
    end

    on /^\/company/ do
      answer_for_recruter
    end
  end

  private

  def on regex, &block
    regex =~ message.text

    if $~
      case block.arity
      when 0
        yield
      when 1
        yield $1
      when 2
        yield $1, $2
      end
    end
  end

  def answer_with_greeting_message
    answer_with_message I18n.t('greeting_message')
    sleep 1
    # answer_with_message I18n.t('greeting_message_1')
    # sleep 2
    # answer_with_message I18n.t('greeting_message_2')
    # sleep 2
    # answer_with_message I18n.t('greeting_message_3')
    # sleep 2
    # answer_with_message I18n.t('greeting_message_4')
    # sleep 2
    # answer_with_message I18n.t('greeting_message_5')
    # sleep 2
    # answer_with_message I18n.t('greeting_message_6')
    # sleep 2
    # answer_with_message I18n.t('greeting_message_7')
    # answer_with_message I18n.t('starting_message')
    answer_with_message I18n.t('greeting_message_yes')
    # sleep 2
  end

  def answer_with_yes_message
    answer_with_message I18n.t('greeting_message_3')

    sleep 2

    answer_with_message I18n.t('starting_profile_email')

    # answer_with_message I18n.t('starting_profile_thanks')
    
    # answer_with_message I18n.t('starting_profile_current_position')

    
    # answer_with_message I18n.t('starting_profile_description')

  end

  def starting_profile_current_position
     answer_with_message I18n.t('starting_profile_current_position')
  end

  def answer_with_new_vacation
    answer_with_message I18n.t('new_vatation')
  end

  def answer_with_farewell_message
    answer_with_message I18n.t('farewell_message')
  end

  def answer_for_recruter
    answer_with_message I18n.t('recruter_message_1')
    answer_with_message I18n.t('recruter_message_2')
    answer_with_message I18n.t('recruter_message_3')
    answer_with_message I18n.t('recruter_message_4')
    answer_with_message I18n.t('recruter_message_5')
    answer_with_message I18n.t('recruter_message_6')
  end

  def answer_with_message(text)
    MessageSender.new(bot: bot, chat: message.chat, text: text).send
  end
end
