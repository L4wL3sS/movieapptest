class PaymentsController < ApplicationController
  def index
  	@payment = current_user.payments
  end
end
