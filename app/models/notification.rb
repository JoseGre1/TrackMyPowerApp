class Notification < ApplicationRecord
  self.inheritance_column = nil
  before_validation :default_values
  belongs_to :user
  belongs_to :source, class_name: 'User', foreign_key: 'source_id'
  validates :type, inclusion:
    { in: ["success", "info", "warning", "error", "dark"] }
  validates :title, length: { maximum: 80 }
  validates :text, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :source_id, presence: true
  protected
  def default_values
    self.seen ||= false
    self.type ||= 'info'
    self.email ||= false
  end
end
