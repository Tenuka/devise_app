class AddBannedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :banned, :string
  end
end
