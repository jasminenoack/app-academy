class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    create_table :groupings do |t|
      t.integer :group_id, null: false
      t.integer :contact_id, null: false
      t.timestamps
    end

    add_index :groupings, :group_id
    add_index :groupings, :contact_id
    add_index :groups, :user_id
  end
end
