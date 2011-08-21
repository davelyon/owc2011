class AddTimestampsAndActiveToQuizzes < ActiveRecord::Migration
  def self.up
    change_table :quizzes do |t|
      t.timestamps
      t.boolean :active
    end
  end

  def self.down
    change_table :quizzes do |t|
      t.remove :created_at
      t.remove :updated_at
      t.remove :active
    end
  end
end
