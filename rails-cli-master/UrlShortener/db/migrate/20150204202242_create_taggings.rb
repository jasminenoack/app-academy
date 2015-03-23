class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :short_url_id

      t.timestamps
    end

    add_index :taggings, :tag_id
    add_index :taggings, :short_url_id
  end
end
