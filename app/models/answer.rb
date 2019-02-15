class Answer < ApplicationRecord
  belongs_to :question
  scope      :all_correct, -> { where(correct: true) }

  validates :body, presence: true
  validates :question, presence: true

  validate :validate_answers_count_in_question

  private

  def validate_answers_count_in_question
    if question&.answers
      answers_count = question.answers.count
      errors.add(:question, "Too many answers(#{answers_count.to_s}) added to question with id: #{question.id}") if answers_count >= 4
    end
  end
end
