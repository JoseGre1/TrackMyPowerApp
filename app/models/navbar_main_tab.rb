require 'ForModules'
class NavbarMainTab < ApplicationRecord
  include ForModules
  has_and_belongs_to_many :dashboard, uniq: true
  has_many :navbar_sub_tabs, dependent: :destroy
  has_one :page, as: :navbar_tab
  validates :title, presence: true,
                    length: { maximum: 20 },
                    uniqueness: { case_sensitive: false,
                                  message: "NavbarMainTab.title already exists in Dashboard" }
  validates :icon, presence: true,
                   length: { maximum: 20 },
                   uniqueness: { case_sensitive: false,
                                 message: "NavbarMainTab.icon already exists in Dashboard" }
  validates :link, presence: true, unless: :dropdown?
  validates :link, length: { maximum: 20 }
  validate :uniqueness_of_tab_title

  def uniqueness_of_tab_title
    errors.add(:title, "Another Navbar_Tab has this title") unless NavbarSubTab.where(title: self.title).count.zero?
  end
  protected
    def dropdown?
      self.class.to_bool(self.dropdown)
    end
end
