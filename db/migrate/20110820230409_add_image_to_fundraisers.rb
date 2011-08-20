class AddImageToFundraisers < ActiveRecord::Migration
  def self.up
    add_column :fundraisers, :image, :text
  end

  def self.down
    remove_column :fundraisers, :image
  end
end
