class AddFkOnQuestionAndCorrectQuestionsToPassedTest < ActiveRecord::Migration[5.2]
  def change
    change_table :passed_tests do |t|
      t.references :current_question, index: true, foreign_key: {to_table: :questions}
      t.integer :correct_questions, default: 0
    end
  end
end
