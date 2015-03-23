class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :short_url_id

      t.timestamps
    end
    add_index :visits, :user_id
    add_index :visits, :short_url_id
  end
end
