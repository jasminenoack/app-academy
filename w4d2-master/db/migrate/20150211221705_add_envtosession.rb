class AddEnvtosession < ActiveRecord::Migration
  def change
  add_column :sessions, :environment, :string
  add_column :sessions, :ip_address, :string
  end
end
