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
  scope :by_category,  -> (title) { joins(:category).where(categories: {title: title}) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0}
  validates :category, presence: true
  validate  :validate_by_level_and_title, on: :create


  def self.by_level_and_title(level, title)
    where(level: level, title: title)
  end

  def self.title_by_category(title)
    by_category(title).order('tests.title DESC').pluck("tests.title")
  end

  private

  def validate_by_level_and_title
    errors.add(:base, "A test with same level and category already exists") if self.class.by_level_and_title(level, title).exists?
  end

end
