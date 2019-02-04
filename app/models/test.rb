class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author

  has_many   :questions
  has_many   :passed_tests
  has_many   :users, through: :passed_tests

  def self.get_by_category(title)
    joins(:category).where(categories: {title: title}).order('tests.title DESC').pluck("tests.title")
  end

end
