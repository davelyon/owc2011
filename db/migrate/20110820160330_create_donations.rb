class CreateDonations < ActiveRecord::Migration
  def self.up
    create_table :donations do |t|
      t.string :title
      t.string :amount
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :donations
  end
end
