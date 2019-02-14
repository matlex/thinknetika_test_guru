class Answer < ApplicationRecord
  belongs_to :question
  scope :all_correct, -> { where(correct: true) }
end
