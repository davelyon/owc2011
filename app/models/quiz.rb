class Quiz < ActiveRecord::Base
  validates :title, :explanation, presence: true

  has_many :questions

  after_save :mark_only_one_as_active

  private

  def mark_only_one_as_active
    if self.active_changed? && self.active?
      self.class.where("id <> ?", self.id).each do |quiz|
        quiz.update_attributes active: false
      end
    end
  end
end
