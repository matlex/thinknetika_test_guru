class AddFkPassedTestsToTests < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :passed_tests, :tests, column: :test_id
  end
end
