class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :album_id, null: false
      t.boolean :bonus
      t.text :lyrics

      t.timestamps
    end
    add_index :tracks, :album_id
    add_index :tracks, :name
  end
end
