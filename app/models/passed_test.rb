class PassedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_next_question

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.save!
  end

  def completed?
    current_question.nil?
  end

  def rate_percentage
    completed? ? ((self.correct_questions.to_f / questions_count) * 100).to_i : 0
  end

  def question_number
    test.questions.order(id: :asc).pluck(:id).index(current_question.id) + 1
  end

  def questions_count
    test.questions.count
  end

  private

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if self.current_question
      self.test.questions.order(:id).where('id > ?', current_question.id).first
    else
      test.questions.first
    end
  end
end
