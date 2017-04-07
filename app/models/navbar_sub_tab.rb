class NavbarSubTab < ApplicationRecord
  belongs_to :navbar_main_tab
  has_one :page, as: :grid
  validates :title, presence: true,
                    length: { maximum: 20 },
                    uniqueness: { case_sensitive: false,
                                  scope: :navbar_main_tab_id,
                                  message: "NavbarSubTab already exists in NavbarMainTab" }
  validates :link, presence: true, length: { maximum: 20 }
  validates :navbar_main_tab_id, presence: true
  #validates :page_id, presence: true
end
