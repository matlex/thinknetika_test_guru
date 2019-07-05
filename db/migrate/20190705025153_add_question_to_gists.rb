class AddQuestionToGists < ActiveRecord::Migration[5.2]
  def change
    remove_column :gists, :question
    add_reference :gists, :question, foreign_key: true
  end
end
