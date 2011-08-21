class CreateKidsCorners < ActiveRecord::Migration
  def self.up
    create_table :kids_corners do |t|
      t.string :title
      t.string :content
      t.timestamps
    end
  end

  def self.down
    drop_table :kids_corners
  end
end
