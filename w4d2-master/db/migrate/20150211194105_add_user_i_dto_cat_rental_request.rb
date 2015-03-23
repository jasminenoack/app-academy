class AddUserIDtoCatRentalRequest < ActiveRecord::Migration
  def change
    add_column :cat_rental_requests, :user_id, :integer
    add_index :cat_rental_requests, :user_id
  end
end
