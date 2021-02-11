class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail(to: @user.email, subject: 'Welcome to MabciaCeramic')
  end

  def order_confirmation(user, baught_items)
    @user = user
    @baught_items = baught_items

    mail(to: @user.email, subject: 'Order confirmation at MabciaCeramic')
  end
end
