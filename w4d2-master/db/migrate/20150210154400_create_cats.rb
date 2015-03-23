class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birth_date
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, null: false
      t.text :description

      t.timestamps
    end
    add_index :cats, :name
  end
end
