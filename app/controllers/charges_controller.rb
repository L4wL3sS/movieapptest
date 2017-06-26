class ChargesController < ApplicationController
	before_action :authenticate_user!
	
	def new
		@user = User.find(params[:user])
		@@user = @user
		@amount = 500
		@@amount = @amount
		@@sub = ""
	  if params[:amount]
	  	@amount = params[:amount]
	  	@@amount = @amount
	  elsif params[:plan] == "bronze"
	  	@amount = 999
	  	@@amount = @amount
	  	@@sub = :plan
	  elsif params[:plan] == "silver"
	  	@amount = 1299
	  	@@amount = @amount
	  	@@sub = :plan
	  elsif params[:plan] == "gold"
	  	@amount = 1999
	  	@@amount = @amount
	  	@@sub = params[:plan]
	  	puts "=" * 50
	  	puts @@sub
	  end
	end

	def create
	# Amount in cents 500cents = 5$
	  @amount = @@amount 
	  @user = @@user
	  @sub = @@sub

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
	  
	  #IMPROVE https://stripe.com/docs/subscriptions/quickstart
	 #  Stripe::Subscription.create(
	 #  :customer => customer.id,
	 #  :plan => "basic-monthly",
		# )
	  
	  #Added to show 
	  @payment = Payment.new
		@payment.user_id = current_user.id
		@payment.channel = "Stripe"
		@payment.active = true
		if @sub == "bronze" || @sub == "silver" || @sub == "gold"
			@payment.subscription = true
			@payment.plan = true #Cambiar por gold/silver/=>string shema
			@payment.amount = @amount
			@payment.save
		else
			@payment.subscription = false
			@payment.plan = false
			@payment.amount = @amount
			@payment.save
			UserNotifierMailer.send_movie_payment(@user).deliver_now
		end
		

		

	#Daria algun error con rescue? <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	flash[:success] = t('payment.create_success')
  	redirect_to settings_path

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
	
	 
end
