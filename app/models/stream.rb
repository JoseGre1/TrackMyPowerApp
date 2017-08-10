class Stream < ApplicationRecord
  before_save :clean_up
  VALID_URL_REGEX = /https?:\/\/[\S]+/
  validates :url, presence: true, format: { with: VALID_URL_REGEX }
  
  protected
    def clean_up
      self.class.last.delete if !self.class.last.nil?
    end
end
