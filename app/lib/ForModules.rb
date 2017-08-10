module ForModules
  extend ActiveSupport::Concern
  module ClassMethods
    def to_bool(obj)
      obj=!!(obj)
    end
  end
end
