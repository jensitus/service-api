require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    let(:mail) { UserMailer.account_activation }

    it "renders the headers" do
      expect(mail.subject).to eq("Account activation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["info@service-b.org"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "password_reset" do
    let(:mail) { UserMailer.password_reset }
let(:user) { create(:user) }
    it "renders the headers" do
      expect(mail.subject).to eq("Password reset")
      # expect(mail.to).to eq(["to@example.org"])
      expect(mail.to).to eq(user.email)
      expect(mail.from).to eq(["info@service-b.org"])
    end

    it "renders the body" do
      puts mail.body.inspect
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
