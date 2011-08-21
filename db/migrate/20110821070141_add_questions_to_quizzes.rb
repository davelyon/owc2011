class AddQuestionsToQuizzes < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :title
      t.belongs_to :quiz

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
