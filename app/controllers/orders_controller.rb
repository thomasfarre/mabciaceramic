class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    cart = Cart.find(params[:cart_id])
    order = Order.create(user_id: current_user.id, cart: cart, amount: cart.total_price, status: 'pending')

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: cart.cart_items.map do |cart_item|
        {
          name: cart_item.item.title,
          amount: (cart_item.item.price * 100).to_i,
          currency: 'eur',
          quantity: 1
        }
      end,

      success_url: order_url(order),
      cancel_url: order_url(order)
    )
    order.update(checkout_session_id: session.id)

    redirect_to edit_user_adress_path(current_user, current_user.adresses)
    # redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = current_user.orders
  end

end
