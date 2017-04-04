class NavbarSubTab < ApplicationRecord
  #before_save :check_subs
  belongs_to :navbar_main_tab
  validates :title, presence: true, length: { maximum: 20 }
  validates :link, presence: true, length: { maximum: 20 }
  validates :navbar_main_tab_id, presence: true

  private
    def check_subs
      unless self.navbar_main_tab.dropdown
        self.navbar_main_tab.navbar_sub_tabs.destroy_all
      end
      false
    end
end
