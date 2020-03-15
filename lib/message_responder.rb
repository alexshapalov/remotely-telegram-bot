require 'active_record'
require './lib/message_sender'

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
  end

  def respond
    on /^\/start/ do
      answer_with_greeting_message
    end

    on /^\/yes/ do      
      answer_with_yes_message

      @user = User.find_or_create_by(chat_id: message.from.id)
      @user.first_name = message.from.first_name,
      @user.last_name = message.from.last_name,
      @user.username = message.from.username,
      @user.email = message.text
      @user.save
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
    answer_with_message I18n.t('greeting_message_yes')
  end

  def answer_with_yes_message
    answer_with_message I18n.t('greeting_message_3')
    sleep 2
    answer_with_message I18n.t('starting_profile_email')
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
