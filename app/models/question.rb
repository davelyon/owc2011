class Question < ActiveRecord::Base
  validates :title, :quiz_id, presence: true

  belongs_to :quiz
end
