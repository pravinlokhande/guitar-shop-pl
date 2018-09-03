class LineItem < ApplicationRecord
  has_many :guitars
  belongs_to :cart

  def total_price
  	guitar = Guitar.find(guitars_id)
    guitar.price.to_i * quantity.to_i
  end
end
