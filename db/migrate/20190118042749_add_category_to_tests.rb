class AddCategoryToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :category
  end
end
