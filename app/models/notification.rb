class Notification < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :user
  validates :type, inclusion:
    { in: ["success", "info", "warning", "error", "dark"] }
  validates :title, length: { maximum: 25 }
  validates :text, length: { maximum: 140 }
end
