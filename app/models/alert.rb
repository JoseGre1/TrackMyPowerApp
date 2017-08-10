class Alert < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :user
  before_validation :default_values
  validates :user_id, presence: true
  validates :type, presence: true, inclusion:
    { in: ActiveRecord::Base.connection.tables.select{ |item| item.include? "measurements" } }
  validates :variable, presence: true
  validate :variable_existance
  validates :comparator, presence: true, inclusion:
    { in: ["greater or equal than", "less or equal than", "belongs to range"].map{|x| x.parameterize(separator: '_')} }
  validates :value1, presence: true, numericality: true
  validates :value2, numericality: true,
                     if: Proc.new { |alert| alert.comparator == "belongs_to_range" }
  validate :consistent_values
  protected
    def variable_existance
      unless self.variable.nil?
        errors.add(:variable, "Variable does not exist in group")  unless self.type.classify.constantize.column_names.include? self.variable
      end
    end
    def consistent_values
      if self.comparator == "belongs_to_range"
        errors.add(:value2, "must be higher than Value") if self.value1.to_i >= self.value2.to_i
      end
    end
    def default_values
      if self.comparator != "belongs_to_range"
        self.value2 ||= nil
      end
    end
end
