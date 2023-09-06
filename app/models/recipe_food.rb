# comment
class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  after_initialize :set_default_quantity

  def set_default_quantity
    self.quantity ||= 1
  end
end
