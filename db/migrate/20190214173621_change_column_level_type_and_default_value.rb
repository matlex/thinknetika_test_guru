class ChangeColumnLevelTypeAndDefaultValue < ActiveRecord::Migration[5.2]
  def up
    change_column         :tests, :level, :integer
    change_column_default :tests, :level, 1
  end

  def down
    change_column         :tests, :level, :string
    change_column_default :tests, :level, "beginner"
  end
end
