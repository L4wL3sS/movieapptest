class MarketingMailer < ActionMailer::Base
	#Class?
		default_url_options[:protocol] = 'http'
		default :form => "support@moviesbio.herokuapp.com"
		default :content_type => "text/html"

	def onboarding_mailer(user)
		@user = user
		@email = user.email

		I18n.with_locale(@user.locale) do
			mail from: I18n.t('mailer.onboarding_mailer')
			to: @email,
			bcc: "mp.didac1989@gmail.com" #"youthcandoit@kolau.com"
			subject: I18n.t('mailer.subject_title_hml', username: @user.username)
		end
	end	
	def onboarding_mailer_second_mailer(user)
		@user = user
		@email = user.email

		I18n.with_locale(@user.locale) do
			mail from: I18n.t('mailer.onboarding_mailer_second_mailer')
			to: @email,
			bcc: "mp.didac1989@gmail.com" #"youthcandoit@kolau.com"
			subject: I18n.t('mailer.subject_title_hml', username: @user.username)
		end	
	end	
	def onboarding_mailer_third_mailer(user)
		@user = user
		@email = user.email

		I18n.with_locale(@user.locale) do
			mail from: I18n.t('mailer.onboarding_mailer_third_mailer')
			to: @email,
			bcc: "mp.didac1989@gmail.com" #"youthcandoit@kolau.com"
			subject: I18n.t('mailer.subject_title_hml', username: @user.username)
		end	
	end	
end