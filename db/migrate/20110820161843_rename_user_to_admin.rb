class RenameUserToAdmin < ActiveRecord::Migration
  def self.up
    rename_table :users, :admins
  end

  def self.down
    rename_table :admins, :users
  end
end
