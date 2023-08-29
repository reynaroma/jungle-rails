require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category) { Category.new(name: 'Example Category') }

    before(:each) do
      @product = Product.new(
        name: 'Example Product', 
        price: 1000, 
        quantity: 10, 
        category: category
      )
    end

    it 'should be valid with valid attributes' do
      expect(@product).to be_valid
    end

    describe 'validations' do
      it "is not valid without a name" do
        @product.name = nil
        expect(@product).to_not be_valid
      end
      it "is not valid without a price" do
        @product.price_cents = nil
        expect(@product).to_not be_valid
      end
      it "is not valid without a quantity" do
        @product.quantity = nil
        expect(@product).to_not be_valid
      end
      it "is not valid without a category" do
        @product.category = nil
        expect(@product).to_not be_valid
      end
    end
  end
end
