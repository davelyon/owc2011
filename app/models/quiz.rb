class Quiz < ActiveRecord::Base
  validates :title, :explanation, presence: true
end
