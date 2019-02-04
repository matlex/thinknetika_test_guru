class AddTestIdToQuestions < ActiveRecord::Migration[5.2]
  def change
    # rails g migration add_test_id_to_questions test_id:integer
    add_column :questions, :test_id, :integer
    add_index  :questions, :test_id
  end
end
