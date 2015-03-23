class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :title, null: false
      t.text :body, null: false
      t.timestamps
    end
    add_index :posts, :title, unique: true
  end
end
