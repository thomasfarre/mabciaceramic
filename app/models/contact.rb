class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: true
  attribute :accept, validate: true
  attribute :message, validate: true
  attribute :nickname, captcha: true

  def headers
    {
      #this is the subject for the email generated, it can be anything you want
      subject: "Contact Form",
      to: 'www.contact@mabciaceramic.com',
      from: %("#{name}" <#{email}>)
      #the from will display the name entered by the user followed by the email
    }
  end
end
