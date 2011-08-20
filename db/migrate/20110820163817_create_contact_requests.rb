class CreateContactRequests < ActiveRecord::Migration
  def self.up
    create_table :contact_requests do |t|
      t.string :contact_type
      t.text :message
      t.string :name
      t.string :phone
      t.string :email
      t.string :organization
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_requests
  end
end
