class Block < ApplicationRecord
  belongs_to :dashboard
  validates :title, presence: true, length: { maximum: 20 }
  validates :subtitle, presence: true, length: { maximum: 80 }
  validates :description, presence: true, length: { maximum: 100 }
  validates :pos_x, presence: true
  validates :pos_y, presence: true
  validates :size_x, presence: true
  validates :size_y, presence: true
  validates :minimizable, presence: true
  validates :closable, presence: true
  validates :movable, presence: true
end
