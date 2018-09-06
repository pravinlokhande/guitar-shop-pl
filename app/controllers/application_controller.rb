class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  include CurrentCart
  before_action :set_cart
end
