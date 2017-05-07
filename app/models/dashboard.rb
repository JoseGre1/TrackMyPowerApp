class Dashboard < ApplicationRecord
  has_many :users
  has_and_belongs_to_many :navbar_main_tabs, uniq: true
  has_many :pages
  validates :description, presence: true, length: { maximum: 25 }, uniqueness: { case_sensitive: false }
end
