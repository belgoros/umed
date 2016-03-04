require 'rails_helper'

describe Contact, type: :model do
  context "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:message)}
    it { should validate_presence_of(:message)}

    it "should be valid" do
      contact = build(:contact)
      expect(contact).to be_valid
    end

    it "should not have a message text to exceed max length" do
      message = "X" * 501
      contact = build(:contact, message: message)
      expect(contact).not_to be_valid
    end

    it "should supply a valid email address" do
      wrong_emails = %w{error @error error-too, 123-mail.com}
      correct_emails = %w{JOHN@mail.com admin.system@yahoo-mail.fr}
      wrong_emails.each do |email|
        contact = build(:contact, email: email)
        expect(contact).not_to be_valid
      end

      correct_emails.each do |email|
        contact = build(:contact, email: email)
        expect(contact).to be_valid
      end
    end
  end
end
