class AddReasonToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :reason, :text
  end

  def self.down
    remove_column :questions, :reason
  end
end
