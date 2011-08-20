class CreateFundraisers < ActiveRecord::Migration
  def self.up
    create_table :fundraisers do |t|
      t.string :name
      t.datetime :time
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :fundraisers
  end
end
