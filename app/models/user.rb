class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests

  def passed_tests_by_level(level_name)
    self.tests.where(level: level_name)
  end
end
