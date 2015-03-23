class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id, null: false
      t.integer :author_id, null: false
      t.integer :parent_id
      t.text :content

      t.timestamps
    end

    add_index :comments, :post_id
    add_index :comments, :author_id
    add_index :comments, :parent_id
  end
end
