class PaymentSelectController < ApplicationController
  def select_plan
  	@movie_id = Movie.find(params[:movie])
  	@user = User.find(params[:user])
  end

  def select_monthly_subscription
  end
end
