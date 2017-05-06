class Alert < ApplicationRecord
  belongs_to :user
  validates :type, inclusion:
    { in: ActiveRecord::Base.connection.tables.select{ |item| item.include? "measurements" } }
  validates :comparator, inclusion:
    { in: ["greater or equal than", "less or equal than", "belongs to range"] }
  validate :variable_existance
  validate :consistent_values
  protected
    def variable_existance
      self.type.classify.constantize.column_names.include? self.variable
    end

    def consistent_values
      self.value1 <= self.value2
    end
end
