class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :session_token
      t.integer :user_id
    end
    add_index :sessions, :session_token, unique: true
    add_index :sessions, :user_id
    remove_column :users, :session_token, :string
  end
end
