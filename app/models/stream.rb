class Stream < ApplicationRecord
  after_save :clean_up
  protected
    def clean_up
      self.class.where('created_at < ?', self.created_at).destroy_all
    end
end
