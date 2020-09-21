require 'rails_helper'

RSpec.describe User, type: :model do

  item {
    described_class.new(:name => 'Jeff', 
    :email => 'jeff@jeff.com', 
    :password => 'jeffiscool123', 
    :password_confirmation => 'jeffiscool123') 
  }

  describe 'Validations' do
    it "is not valid without a name" do
      item.name = nil
      expect(item).to_not be_valid
    end
    
    it "is not valid without an email" do
      item.email = nil
      expect(item).to_not be_valid
    end
    
    it "is not valid without a password" do
      item.password = nil
      expect(item).to_not be_valid
    end
      
    it "password should contain at least 6 characters" do
      item.password = 'jeffisntcool123'
      item.password_confirmation = 'jeffisntcool123'
      expect(item).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it "has a valid email and password" do
      item.save
      expect(User.authenticate_with_credentials(item.email, item.password)).to eq(item)
    end

    it "does not have a valid email or password in db" do
      item.save
      expect(User.authenticate_with_credentials("notjeff@jeff.com", item.password)).to_not eq(item)
    end
  end

end