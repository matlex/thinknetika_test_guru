class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  def self.get_by_category(title)
    joins(:category).where(categories: {title: title}).order('tests.title DESC').pluck("tests.title")
  end

end
