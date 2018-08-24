class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, force: true do |t|
      t.integer :uid
      t.string :name
      t.string :email
      t.string :position
      t.string :description
    end
  end
end
