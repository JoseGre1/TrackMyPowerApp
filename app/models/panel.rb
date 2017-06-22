require 'ForModules'
class Panel < ApplicationRecord
  include ForModules
  belongs_to :row
  before_validation :all_to_bool
  before_validation :default_values
  validates :title, presence: true, length: { maximum: 25 },
    uniqueness: { scope: :row, message: "Panel has already this title" }
  validates :subtitle, length: { maximum: 80 }
  validates :description, presence: true, length: { maximum: 25 }
  validates :order, presence: true,
    uniqueness: { scope: :row, message: "Panel has already this order number" },
    numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :width, presence: true,
                    numericality: {
                      only_integer: true,
                      less_than_or_equal_to: 12,
                      greater_than_or_equal_to: 1 }
  validates :row_id, presence: true
  validate :width_sum
  protected
    def all_to_bool
      self.minimizable = self.class.to_bool(self.minimizable)
      self.closable = self.class.to_bool(self.closable)
      self.movable = self.class.to_bool(self.movable)
    end
    def default_values
      self.title ||= "New Panel (id: #{self.id})"
      self.subtitle ||= ""
      self.description ||= self.title
      self.order ||= self.class.where(row: self.row).maximum(:order).to_i + 1
      self.width ||= 12
      self.movable ||= false
      self.minimizable ||= false
      self.closable ||= false
    end
    def width_sum
      if self.width + 1 > 100
        errors.add(:width, "Maximum width exceeded")
      end
    end
end
