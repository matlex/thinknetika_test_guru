class AddQuestionRefToAnswers < ActiveRecord::Migration[5.2]
  def change
    # rails g migration add_question_ref_to_answers question:references
    add_reference :answers, :question, foreign_key: true
  end
end
