require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'ensure a product with all four fields saves successfully' do
      @category = Category.new
      @category.name = "TestCata"
      @category.save!

      @product = Product.new
      @product.name = "TestProd"
      @product.price = 20
      @product.quantity = 2
      @product.category = @category
      @product.save!

      expect(@product.id).to be_present
    end

    it 'should validate name ' do
      @category = Category.new
      @category.name = "TestCata"
      @category.save!

      @product = Product.new
      @product.name = nil
      @product.price = 20
      @product.quantity = 2
      @product.category = @category
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Name can't be blank"]
    end

    it 'should validate price ' do
      @category = Category.new
      @category.name = "TestCata"
      @category.save!

      @product = Product.new
      @product.name = "TestProd"
      @product.price_cents = nil
      @product.quantity = 2
      @product.category = @category
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should validate quantity ' do
      @category = Category.new
      @category.name = "TestCata"
      @category.save!

      @product = Product.new
      @product.name = "TestProd"
      @product.price_cents = 20
      @product.quantity = nil
      @product.category = @category
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should validate quantity ' do
      @category = Category.new
      @category.name = "TestCata"
      @category.save!

      @product = Product.new
      @product.name = "TestProd"
      @product.price_cents = 20
      @product.quantity = 2
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
