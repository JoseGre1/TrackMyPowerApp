class Page < ApplicationRecord
  has_many :blocks
  belongs_to :grid, polymorphic: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 25 }
end
