class AddFkUsersToPassedTests < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :passed_tests, :users, column: :user_id
  end
end
