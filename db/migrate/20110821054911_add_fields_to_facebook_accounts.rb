class AddFieldsToFacebookAccounts < ActiveRecord::Migration
  def self.up
    add_column :facebook_accounts, :page_id, :string
    add_column :facebook_accounts, :page_token, :string
  end

  def self.down
    remove_column :facebook_accounts, :page_token
    remove_column :facebook_accounts, :page_id
  end
end
