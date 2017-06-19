class PaymentSelectController < ApplicationController
  def select_plan
  	@movie_id = Movie.find(params[:movie])
  end

  def select_monthly_subscription
  end
end
