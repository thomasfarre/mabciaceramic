class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail(to: @user.email, subject: 'Bienvenue sur MabciaCeramic')
  end

  def order_confirmation(user, bought_items, order)
    @user = user
    @bought_items = bought_items
    @order = order

    mail(to: @user.email, subject: 'Confirmation de votre commande sur MabciaCeramic')
  end

  def deliver_confirmation(user, order)
    @user = user
    @order = order

    mail(to: @user.email, subject: 'Confirmation de votre commande sur MabciaCeramic')
  end
end
