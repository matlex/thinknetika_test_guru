class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i

  has_many :created_tests, class_name: 'Test'

  has_many :passed_tests
  has_many :tests, through: :passed_tests

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
                  presence: true,
                  format: { with: VALID_EMAIL_REGEX, message: 'only valid emails allowed' },
                  uniqueness: true

  has_secure_password

  def passed_tests_by_level(level_name)
    self.tests.where(level: level_name)
  end

  def test_passage(test)
    self.passed_tests.order(id: :desc).find_by(test_id: test.id)
  end
end
