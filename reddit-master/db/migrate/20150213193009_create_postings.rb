class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.integer :post_id, null: false
      t.integer :sub_id, null: false

      t.timestamps
    end
    add_index :postings, :post_id
    add_index :postings, :sub_id
    add_index :postings, [:sub_id, :post_id], unique: true
  end
end
