class CreatePassedTest < ActiveRecord::Migration[5.2]
  def change
    create_table :passed_tests do |t|
      t.integer :user_id
      t.integer :test_id

      t.timestamps
    end
  end
end
