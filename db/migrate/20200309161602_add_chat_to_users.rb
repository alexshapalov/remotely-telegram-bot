class AddChatToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.integer :chat_id
    end
  end
end
