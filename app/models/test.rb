class Test < ApplicationRecord
  belongs_to :category

  def self.get_by_category(title)
    joins(:category).where(categories: {title: title}).order('id DESC')
  end

end
