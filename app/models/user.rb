class User < ApplicationRecord
  def get_tests_by_level(level_name)
    Test.where("level = :level_name AND user_id = :user_id", level_name: level_name, user_id: self.id)
  end
end
