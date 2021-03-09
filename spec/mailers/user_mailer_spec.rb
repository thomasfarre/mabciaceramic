require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome" do
    subject { User.new(first_name: 'Toto', last_name: 'LeToto', email: 'toto@toto.com') }
    let(:mail) { UserMailer.welcome(subject) }

    it "renders the headers" do
      expect(mail.subject).to eq("Bienvenue sur MabciaCeramic")
      expect(mail.to).to eq(["toto@toto.com"])
      expect(mail.from).to eq(["contact@mabciaceramic.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Bienvenue")
    end
  end
end
