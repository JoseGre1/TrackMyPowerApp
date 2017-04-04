class NavbarMainTab < ApplicationRecord
  before_validation { dropdown=!!dropdown }
  belongs_to :dashboard
  has_many :navbar_sub_tabs, dependent: :destroy
  validates :dashboard_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :icon, presence: true, length: { maximum: 20 }
  validates :link, presence: true, length: { maximum: 20 }, if: "!dropdown"
end
