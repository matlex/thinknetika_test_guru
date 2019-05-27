class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test'

  has_many :passed_tests
  has_many :tests, through: :passed_tests

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def passed_tests_by_level(level_name)
    self.tests.where(level: level_name)
  end

  def test_passage(test)
    self.passed_tests.order(id: :desc).find_by(test_id: test.id)
  end
end
