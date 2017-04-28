class Stream < ApplicationRecord
  before_save :clean_up
  protected
    def clean_up
      self.class.last.delete
    end
end
