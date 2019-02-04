class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests

  def passed_tests_by_level(level_name)
    Test.joins("JOIN passed_tests ON tests.id = passed_tests.test_id AND passed_tests.user_id = #{self.id}").where(level: level_name)
  end
end
