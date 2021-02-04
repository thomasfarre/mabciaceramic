class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')

    # This doesn't work yet don't know why
    # order.cart.cart_items { |item| item.item.update(status: 'removed') }

    order.cart.destroy
  end
end
