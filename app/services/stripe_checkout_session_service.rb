class StripeCheckoutSessionService
  def call(event)

    order = Order.find_by(checkout_session_id: event.data.object.id)
    user = order.user
    order.update(status: 'paid')

    bought_items = []
    order.cart.cart_items.each do |cart_item|
      cart_item.item.update(status: 'removed')
      bought_items << cart_item
    end

    order.cart.update(status: 'inactive')

    UserMailer.order_confirmation(user, bought_items, order).deliver_now
  end
end
