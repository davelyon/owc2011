class Quiz < ActiveRecord::Base
  validates :title, :explanation, presence: true

  has_many :questions
end
