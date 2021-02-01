class OrdersController < ApplicationController

  def create
    cart = Cart.find(params[:cart_id])
    order = Order.create!(cart: cart, amount: cart.total_price, state: 'pending')


      session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
          line_items: cart.cart_items.map { |cartItem|
            {
              name: cartItem.item.title,
              amount: (cartItem.item.price * 100).to_i,
              currency: 'eur',
              quantity: 1,
            }},

        success_url: order_url(order),
        cancel_url: order_url(order)
      )
    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.find(params[:id])
  end
end


# name: cartItem.item.title,
#           images: [cartItem.item.photos[0].key],
#           amount: cartItem.item.price,
#           currency: 'eur',
#           quantity: 1
