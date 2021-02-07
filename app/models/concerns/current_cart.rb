module CurrentCart

  private

  def set_cart
    @cart = Cart.find_by!(id: session[:cart_id], status: 'active')
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  # For futur version with persistent cart everywhere

  # def set_cart
  #   if !current_user.nil?
  #     if current_user.cart.nil?
  #       @cart = Cart.create(user_id: current_user.id)
  #     else
  #       @cart = current_user.cart
  #     end
  #   else
  #     if session[:cart]
  #       @cart = Cart.find(session[:cart])
  #     else
  #       @cart = Cart.last
  #       session[:cart] = @cart.id
  #     #   raise
  #     #   @cart = Cart.create
  #     #   session[:cart] = @cart.id
  #     end
  #   end
  # end

end



