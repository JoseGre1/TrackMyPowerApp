class NavbarSubTab < ApplicationRecord
  belongs_to :navbar_main_tab
  has_one :page, as: :navbar_tab
  validates :title, presence: true,
                    length: { maximum: 20 },
                    uniqueness: { case_sensitive: false,
                                  scope: :navbar_main_tab_id,
                                  message: "NavbarSubTab already exists in NavbarMainTab" }
  validates :link, presence: true, length: { maximum: 20 }
  validates :navbar_main_tab_id, presence: true
  validate :uniqueness_of_tab_title

  def uniqueness_of_tab_title
    errors.add(:title, "Another Navbar_Tab has this title") unless NavbarMainTab.where(title: self.title).count.zero?
  end
end
