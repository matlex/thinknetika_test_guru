class Category < ApplicationRecord
  has_many :tests

  default_scope { order(title: :asc ) }

  validates :title, uniqueness: true,
                    presence: true
end
