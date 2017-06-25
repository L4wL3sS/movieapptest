namespace :first_action_job do
	desc "Welcome user"
	task onboarding_mailer_task: :environment do
		#if Time.now.day
			# NameJob.perform_later
			#UserNotifierMailer.send_signup_email(user).deliver_now		#perform_now
			OnboardingMailer.perform_now
		#end
	end
end

