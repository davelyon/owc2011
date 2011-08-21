class Answer < ActiveRecord::Base
  validates :question_id, :title, presence: true
  belongs_to :question

  after_save :mark_only_one_as_correct

  private

  def mark_only_one_as_correct
    if self.correct_changed? && self.correct?
      self.question.answers.where("answers.id <> ?", self.id).each do |answer|
        answer.update_attributes correct: false
      end
    end
  end
end
