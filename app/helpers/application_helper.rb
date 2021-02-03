module ApplicationHelper

  def cart_count_over_one
    "#{@cart.cart_items.count}" unless @cart.cart_items.count.negative?
  end

  def cart_has_items
    @cart.cart_items.count.positive?
  end
end
