require 'rails_helper'

describe Contact do
  it "should have a valid factory" do
    contact = FactoryGirl.build(:contact)
    expect(contact).to be_valid
  end

  describe "Validation" do
    it "should test to see if name is present" do
      contact = FactoryGirl.build(:contact, name: nil)
      expect{ contact.save }.not_to change(Contact, :count)
      expect(contact.errors[:name]).to be_present
    end

    it "should test to see if email is present" do
      contact = FactoryGirl.build(:contact, email: nil)
      expect{ contact.save }.not_to change(Contact, :count)
      expect(contact.errors[:email]).to be_present
    end

    it "should test to see if comment is present" do
      contact = FactoryGirl.build(:contact, comments: nil)
      expect{ contact.save }.not_to change(Contact, :count)
      expect(contact.errors[:comments]).to be_present
    end
  end
end
