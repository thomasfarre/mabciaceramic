class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart

  # For futur version with persistent cart everywhere

  # before_action :after_sign_in, only: :create, if: :devise_controller?
  # before_action :after_sign_out, only: :destroy, if: :devise_controller?

  # def after_sign_in
  #   if session[:cart]
  #     guest_cart = Cart.find(session[:cart])
  #     cart = Cart.cr
  #     guest_cart.cart_items.each { |item| CartItem.create!(cart_id: set_cart.id, item_id: item.item_id) }
  #     guest_cart.destroy
  #     session[:cart] = nil

  #   end
  # end

  # def after_sign_out
  #   cart = current_user.cart
  #   guest_cart = Cart.create
  #   session[:cart] = guest_cart.id
  #   cart.cart_items.each { |item| CartItem.create!(cart_id: session[:cart], item_id: item.item_id) }
  #   cart.destroy
  # end
end
