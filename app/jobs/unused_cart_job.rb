class UnusedCartJob < ApplicationJob
  queue_as :default

  def perform(*args)
    carts = Cart.all

    carts.each do |cart|
      cart.destroy if cart.order.nil?
    end
  end
end
