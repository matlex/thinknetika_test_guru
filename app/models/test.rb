class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  has_many   :questions
  has_many   :passed_tests
  has_many   :users, through: :passed_tests

  scope :by_level,     -> (level) { where(level: level) }
  scope :easy_level,   -> { by_level(0..1) }
  scope :middle_level, -> { by_level(2..4) }
  scope :pro_level,    -> { by_level(5..Float::INFINITY) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0}
  validates :category, presence: true

  def self.get_by_category(title)
    joins(:category).where(categories: {title: title}).order('tests.title DESC').pluck("tests.title")
  end

end
