class AddLevelsTitleNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:levels, :title, false)
  end
end
