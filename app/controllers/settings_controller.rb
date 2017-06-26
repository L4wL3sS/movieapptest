class SettingsController < ApplicationController
	before_action :authenticate_user!
	layout "admin"

	def index
	    @setting = current_user.setting
	    
	    @payment = current_user.payments
	    
	    #CONTROL DE ERRORES!!!! EJEMPLO
	 #    puts "=" * 100
	 #    puts current_user.id
	 #    puts current_user.id == 1
		# puts "=" * 100

		#----------------------------------------------------------

	 #    puts "=" * 100
	 #    @menjar = "empty meal"
	 #    if @seting.country == "Spain"
	 #    	@menjar ="tapas"
	 #    elsif @setting.country == "Andorra"
	 #    	@menjar ="sopa"
	 #    else
	 #    	@menjar = "\tburger"
	 #    end
	 #    puts "=" * 100
	 #    puts @menjar
		# puts "=" * 100

		#----------------------------------------------------------

	    # puts "=" * 100

	    # if @setting.country == "Spain"
	    # 	puts "Si"
	    # else
	    # 	puts "No"
	    # 	puts "Current: " + @setting.country
	    # end
	    # puts "=" * 100

	    #didn't worck for me T_T?
	    # @payment = []
	    # if current_user.payments.exists?
	    #   @payment = Payments.find_by(user_id: current_user.id)	      
	    # end 

	end

  def show
  	@setting = setting.find(params[:id])
  end	

  def new  	
  	@setting = current_user.build_setting
  	#@setting = Setting.new #hack
  end

  def create
	  @setting = current_user.build_setting(setting_params)
	 
	  if @setting.save
	  		flash[:success] = t('setting.create_success')
			redirect_to settings_path
	  else
	  		#flash[:danger] = t('setting.create_not_success')	#devise errors will do fine
			render :new

	  end
  end

	def edit 
		@setting = Setting.find(params[:id])
	end

	def update
		@setting = Setting.find(params[:id])
		if @setting.update_attributes(setting_params)
			flash[:success] = t('setting.create_success')
   			redirect_to settings_path
		else
			#flash[:danger] = t('setting.create_not_success')  #devise errors will do fine
			render :edit
		end
	end

  def setting_params
  	params.require(:setting).permit(:language, :country)
  end

end
