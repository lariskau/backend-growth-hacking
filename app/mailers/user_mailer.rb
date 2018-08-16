class UserMailer < ApplicationMailer
  default from: 'bougaut.lea@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://www.thehackingproject.org/'
    mail(to: @user.email, subject: 'Et si tu apprenais à coder pour changer de vie ?')
  end

end
