module ApplicationHelper

  def cart_count_over_one
    if @cart.cart_items.count > 0
      return "#{@cart.cart_items.count}"
    end
  end

  def cart_has_items
    return @cart.cart_items.count > 0
  end
end
