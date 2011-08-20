class AddEndAtToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :end_at, :datetime
  end

  def self.down
    remove_column :events, :end_at
  end
end
