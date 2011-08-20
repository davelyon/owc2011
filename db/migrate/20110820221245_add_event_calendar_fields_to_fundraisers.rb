class AddEventCalendarFieldsToFundraisers < ActiveRecord::Migration
  def self.up
    change_table :fundraisers do |t|
      t.remove :time
      t.datetime :start_at, :end_at
    end
  end

  def self.down
    change_table :fundraisers do |t|
      t.remove :start_at, :end_at
      t.datetime :time
    end
  end
end
