class Comments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id, null: false
      t.string :commentable_type, null: false
      t.integer :commentable_id, null: false
      t.string :content, null: false
      t.timestamps null: false
    end

    add_index :comments, :author_id
    add_index :comments, [:commentable_id, :commentable_type]
  end
end
