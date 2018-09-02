class Guitar < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  has_many :line_items

  private

  def not_referenced_by_any_line_item
  	unless line_items.empty?
  	  errors.add(:base, "Line item present.")
  	  throw :abort
  	end
  end
end
