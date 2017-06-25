class OnboardingMailer < ApplicationJob
	queue_as :default
	def perform(user=nil)
		unless user.is_a?(Array)
			if user.is_a?(User)
				user = [user]
			else
				#user = User.where('canceled IS NO TRUE and active is TRUE')
				user = User.all
			end			
		end
		user.each do |user|
			#begin
				if user.created_at < 10.hours.ago
					if user.marketing_mailer.blank?
						user.marketing_mailer = 1
						user.marketing_mailer_date = DateTime.current
						user.save
						UserNotifierMailer.send_signup_email(user).deliver_now		#perform_later
						#MarketingMailer.onboarding_mailer(user).deliver_now
					elsif user.marketing_mailer == 1 && user.marketing_mailer_date < 10.minutes.ago		#days.ago
						user.marketing_mailer = 2
						user.marketing_mailer_date = DateTime.current	#Time.now#Date.today
						user.save
						UserNotifierMailer.send_signup_email_second(user).deliver_now #perform_later
						#MarketingMailer.onboarding_mailer_second_mailer(user).deliver_now
					elsif user.marketing_mailer == 2 && user.marketing_mailer_date < 2.hours.ago		#days.ago
						user.marketing_mailer = 3
						user.marketing_mailer_date = DateTime.current	#Time.now#Date.today
						user.save
						UserNotifierMailer.send_signup_email_third(user).deliver_now #perform_later
						#MarketingMailer.onboarding_mailer_third_mailer(user).deliver_now	
					end
				end
			# rescue => e
			# 	message = "user-#{user.id} \n\t#{e.message}\n\n \t#{e.backtrace.join("\n\t")}"
			# 	LogManager.create(:user=>user.id,:exception_message=>message,:tag=>"MailerError")
			# end
		end
	end
end

