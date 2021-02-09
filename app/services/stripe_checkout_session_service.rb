class StripeCheckoutSessionService
  def call(event)

    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(status: 'paid')

    # This doesn't work yet don't know why
    order.cart.cart_items.each do |cart_item|
      cart_item.item.update!(status: 'removed')
    end

    order.cart.update(status: 'inactive')
  end
end
