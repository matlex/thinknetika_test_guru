class AddIndexCurrentQuestionCorrectQuestionsToPassedTest < ActiveRecord::Migration[5.2]
  def change
    change_table :passed_tests do |t|
      t.index :user_id
      t.index :test_id

      t.foreign_key :user_id
      t.foreign_key :test_id

      t.references :current_question, foreign_key: true
      t.integer :correct_questions, default: 0
    end
  end
end
