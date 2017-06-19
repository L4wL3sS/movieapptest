require 'test_helper'

class PaymentSelectControllerTest < ActionDispatch::IntegrationTest
  test "should get select_plan" do
    get payment_select_select_plan_url
    assert_response :success
  end

  test "should get select_monthly_subscription" do
    get payment_select_select_monthly_subscription_url
    assert_response :success
  end

end
