class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, force: true do |t|
      t.integer :uid
      t.integer :name
      t.integer :email
      t.integer :position
      t.integer :description
    end
  end
end
