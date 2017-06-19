class ChargesController < ApplicationController
	before_action :authenticate_user!
	
	def new
		@amount = 500
		@@amount = @amount
	  if params[:amount]
	  	@amount = params[:amount]
	  	@@amount = @amount
	  end
	end

	def create
	# Amount in cents 500cents = 5$
	  @amount = @@amount 

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'eur'
	  )
	  #Added for test to table fixet amount
	  #current_user.payments.create(subscription: false, channel: "stripe", active: true, plan: 5, amount: 5)

	  #Added to show 
	  @payment = Payment.new
		@payment.user_id = current_user.id
		@payment.channel = "Stripe"
		@payment.active = true
		@payment.subscription = false
		@payment.plan = @amount
		@payment.amount = @amount
		@payment.save

	#Daria algun error con rescue? <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	flash[:success] = t('payment.create_success')
  	redirect_to settings_path

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
	
	 
end
