class Stream < ApplicationRecord
  before_save :clean_up
  protected
    def clean_up
      self.class.last.delete if !self.class.last.nil?
    end
end
