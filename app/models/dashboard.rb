class Dashboard < ApplicationRecord
  has_many :users
  has_and_belongs_to_many :navbar_main_tabs
  has_many :blocks
  validates :description, presence: true, length: { maximum: 25 }
end
