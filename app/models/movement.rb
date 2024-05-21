class Movement < ApplicationRecord
  belongs_to :product

  validates :type_movement, presence: true
  validates :amount, presence: true  

  validate :amount_is_greather_than_stock_product, if: :verify_movement

  after_save :change_product

  def change_product
    if type_movement == 2
      new_stock = product.amount - amount 
      product.update(amount: new_stock)
    else
      new_stock = product.amount + amount
      product.update(amount: new_stock)
    end
  end

  def verify_movement
    type_movement == 2    
  end

  def amount_is_greather_than_stock_product
    if amount > product.amount
      errors.add(:amount, 'La cantidad supera al stock de producto')
    end
  end
end
