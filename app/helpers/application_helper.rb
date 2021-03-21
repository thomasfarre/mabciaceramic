module ApplicationHelper

  def cart_count_over_one
    "#{@cart.cart_items.count}" unless @cart.cart_items.count.negative?
  end

  def cart_has_items
    @cart.cart_items.count.positive?
  end

  def estimated_delivery_date
    day = Date.today.strftime('%A')

    if day == "Sunday"
      l(Date.today.next_day(8), format: "%A, %d, %B", locale: "fr")
    else
      l(Date.today.next_day(7), format: "%A, %d, %B", locale: "fr")
    end
  end

  def image_position(item)
    case item.position
    when "top"
      'object-right-top'
    when "bottom"
      'object-bottom'
    else
      'object-center'
    end
  end
end
