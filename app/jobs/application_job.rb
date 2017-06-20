class Marketing::OnboardingMailer < ApplicationJob
#class ApplicationJob < ActiveJob::Base
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
			begin
				if user.created_At < 1.minutes.ago		#hour.ago
					if user.maketing_mailer.blank?
						user.marketing_mailer = 1
						user.marketing_mailer_date = Date.today
						user.save
						MarketingMailer.onboarding_mailer(user).deliver_now
					elsif user.marketing_mailer == 1 && user.marketing_mailer_date > 2.minutes.ago		#days.ago
						user.marketing_mailer = 2
						user.marketing_mailer_date = Date.today
						user.save
						MarketingMailer.onboarding_mailer_second_mailer(user).deliver_now
					elsif user.marketing_mailer == 2 && user.marketing_mailer_date > 4.minutes.ago		#days.ago
						user.marketing_mailer = 3
						user.marketing_mailer_date = Date.today
						user.save
						MarketingMailer.onboarding_mailer_third_mailer(user).deliver_now	
					end
				end
			rescue => e
				message = "user-#{user.id} \n\t#{e.message}\n\n \t#{e.backtrace.join("\n\t")}"
				LogManager.create(:user=>user.id,:exception_message=>message,:tag=>"MailerError")
			end
		end
	end
end
