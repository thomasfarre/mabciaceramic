class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.last
    UserMailer.with(user: user).welcome
  end
end
