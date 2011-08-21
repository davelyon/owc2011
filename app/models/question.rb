class Question < ActiveRecord::Base
  validates :title, :reason, :quiz_id, presence: true

  belongs_to :quiz
  has_many :answers
end
