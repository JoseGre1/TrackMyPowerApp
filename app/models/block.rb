class Block < ApplicationRecord
  include ForModules
  belongs_to :page
  before_save{ all_to_bool }
  validates :title, presence: true, length: { maximum: 20 }
  validates :subtitle, presence: true, length: { maximum: 80 }
  validates :description, presence: true, length: { maximum: 25 }
  validates :pos_x, :pos_y, presence: true,
                              numericality: {
                                only_integer: true,
                                greater_than_or_equal_to: 0 }
  validates :pos_x, numericality: { less_than_or_equal_to: 2 }
  validates :size_x, :size_y, presence: true,
                              numericality: {
                                only_integer: true,
                                less_than_or_equal_to: 3,
                                greater_than_or_equal_to: 1 }
  validates :minimizable, presence: true
  validates :closable, presence: true
  validates :movable, presence: true

  protected
    def all_to_bool
      to_bool(self.minimizable)
      to_bool(self.closable)
      to_bool(self.movable)
    end
end
