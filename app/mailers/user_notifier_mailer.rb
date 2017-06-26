class UserNotifierMailer < ApplicationMailer

  default :from => 'lawl3ss.movie@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
      @user = user
      mail( :to => @user.email,
      #bcc: "mp.didac1989@gmail.com",
      :subject => 'Thanks for signing up on our amazing app' )
  end

  def send_signup_email_second(user)
      @user = user
      mail( :to => @user.email,
      #bcc: "mp.didac1989@gmail.com",
      :subject => 'Thanks for signing up on our amazing app' )
    
  end

  def send_signup_email_third(user)
      @user = user
      mail( :to => @user.email,
      #bcc: "mp.didac1989@gmail.com",
      :subject => 'Thanks for signing up on our amazing app' )
    
  end

  def send_movie_payment(user)
    @user = user
    mail( :to => @user.email,
    #bcc: "mp.didac1989@gmail.com",
    :subject => 'Thanks for buying in our amazing app' )
  end
end
