class Tile < ApplicationRecord
  belongs_to :page
  default_scope -> { order(order: :desc) }
  validates :title, presence: true, length: { maximum: 25 },
    uniqueness: { scope: :page, message: "Tile has already this title" }
  validates :description, presence: true, length: { maximum: 25 }
  validates :icon, presence: true,
   length: { maximum: 20 },
   uniqueness: { scope: :page, message: "Tile has already this icon" }
  validates :order, presence: true,
    uniqueness: { scope: :page, message: "Tile has already this title" }
  validates :page_id, presence: true
  validate :capacity
  protected
    def capacity
      if self.class.where(page: self.page).count >= 6
        errors.add(:order, "Maximum number of tiles in a page reached (6)")
      end
    end
end
