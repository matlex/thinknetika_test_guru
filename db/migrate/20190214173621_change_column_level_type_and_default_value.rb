class ChangeColumnLevelTypeAndDefaultValue < ActiveRecord::Migration[5.2]
  def up
    execute "ALTER TABLE tests ALTER level DROP DEFAULT;"
    change_column :tests, :level, :integer, using: 'level::integer', default: 1
  end

  def down
    change_column         :tests, :level, :string
    change_column_default :tests, :level, "beginner"
  end
end
