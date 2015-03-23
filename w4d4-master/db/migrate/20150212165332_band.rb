class Band < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :bands, :name, unique: true
  end
end
