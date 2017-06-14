class SettingsController < ApplicationController
	before_action :authenticate_user!
	layout "admin"

  def index
  	@setting = current_user.setting
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
			redirect_to settings_path
	  else
			render :new
	  end
  end

	def edit 
		@setting = Setting.find(params[:id])
	end

	def update
		@setting = Setting.find(params[:id])
		if @setting.update_attributes(setting_params)
   		redirect_to settings_path
	  else
			render :index
	  end
	end

  def setting_params
  	params.require(:setting).permit(:language, :country)
  end

end
