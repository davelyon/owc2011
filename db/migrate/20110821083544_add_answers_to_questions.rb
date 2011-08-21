class AddAnswersToQuestions < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :title
      t.boolean :correct

      t.belongs_to :question

      t.timestamps
    end

  end

  def self.down
    drop_table :answers
  end
end
