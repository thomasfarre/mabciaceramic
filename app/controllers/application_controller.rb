class ApplicationController < ActionController::Base
  include CurrentCart
  skip_before_action :verify_authenticity_token
  before_action :set_cart
end
