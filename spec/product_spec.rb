require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    item { 
      described_class.new(
        name: "Jumbo Rubby Ducky", 
        price_cents: 1000, quantity: 100, 
        category: Category.new(name: "Furniture")
        )
     }

    it "is not valid without a name" do
      item.name = nil
      expect(item).to_not be_valid
    end

    it "is not valid without a price" do
      item.price_cents = nil
      expect(item).to_not be_valid
    end

    it "is not valid without a quantity" do
      item.quantity = nil
      expect(item).to_not be_valid
    end

    it "is not valid without a category" do
      item.category = nil
      expect(item).to_not be_valid
    end
  end

end