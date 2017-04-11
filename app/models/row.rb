class Row < ApplicationRecord
  belongs_to :page
  has_many :panels
  before_validation :default_values
  validates :capacity, numericality: {
                         only_integer: true,
                         less_than_or_equal_to: 3,
                         greater_than_or_equal_to: 1 }
  validates :height, numericality: {
                         only_integer: true,
                         greater_than_or_equal_to: 280 }
  validates :order, uniqueness: { scope: :page, message: "Row has already this order number" },
                    numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :page_id, presence: true
  protected
    def default_values
      self.capacity ||= 1
      self.height ||= 280
      self.order ||= self.class.where(page: self.page).maximum(:order).to_i + 1
    end
end
