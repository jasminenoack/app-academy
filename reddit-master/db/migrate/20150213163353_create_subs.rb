class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description
      t.integer :moderator_id, null: false

      t.timestamps
    end
    add_index :subs, :title, unique: true
    add_index :subs, :moderator_id
  end
end
