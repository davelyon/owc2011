class AddLocationToFundraiser < ActiveRecord::Migration
  def self.up
    add_column :fundraisers, :location, :string
  end

  def self.down
    remove_column :fundraisers, :location
  end
end
