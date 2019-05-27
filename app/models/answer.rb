class Answer < ApplicationRecord
  belongs_to :question
  scope      :correct, -> { where(correct: true) }

  validates :body, presence: true
  validates :question, presence: true

  validate :validate_answers_count_in_question, on: :create

  MAX_ALLOWED_ANSWERS_COUNT = 4

  private

  def validate_answers_count_in_question
    if question&.answers
      answers_count = question.answers.count
      errors.add(:question, "Too many answers(#{answers_count.to_s}) added to question with id: #{question.id}") if answers_count >= MAX_ALLOWED_ANSWERS_COUNT
    end
  end
end
