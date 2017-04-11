class Page < ApplicationRecord
  has_many :tiles
  has_many :rows
  before_validation :associate_page_to_navbar_tab
  belongs_to :navbar_tab, polymorphic: true
  belongs_to :dashboard
  validates :title, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum: 25 }
  validates :navbar_tab_id, :navbar_tab_type, :dashboard_id, presence: true
  validate :page_to_navbar_tab_association
  protected
    def associate_page_to_navbar_tab
      if !NavbarMainTab.where(title: self.title).count.zero?
        if !NavbarMainTab.where(title: self.title).first.dropdown
          self.navbar_tab = NavbarMainTab.find_by(title: self.title)
        end
      end
      if !NavbarSubTab.where(title: self.title).count.zero?
        self.navbar_tab = NavbarSubTab.find_by(title: self.title)
      end
    end

    def page_to_navbar_tab_association
      if NavbarMainTab.where(title: self.title).first.nil? && NavbarSubTab.where(title: self.title).first.nil?
        errors.add(:navbar_tab, "No Navbar_Tab with that title")
        return
      elsif !NavbarMainTab.where(title: self.title).first.nil?
        if NavbarMainTab.where(title: self.title).first.dropdown
          errors.add(:navbar_tab, "Navbar_tab has dropdown")
          return
        end
      end
    end
end
