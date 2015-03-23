class Remove < ActiveRecord::Migration
  def change
    remove_index :bands, :name
    add_index :bands, [:name, :user_id], unique: true
  end
end
