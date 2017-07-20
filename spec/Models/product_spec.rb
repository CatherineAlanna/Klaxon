require 'rails_helper'

describe Product do

  context "when the product has comments" do

    let(:product) { Product.create!(name: "Awesomeness T-shirt", description: "T-shirt that is nice.", price: "20", color: "Blue", image_url: "http://images.shirts.com/products/23825/13-14/archer-awesomeness-t-shirt.jpg") }
    let(:user) { User.create!(first_name: "Catherine", last_name: "Alanna", email: "hello@catherinealanna.com", password: "123456") }

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful T-shirt!")
      product.comments.create!(rating: 3, user: user, body: "Okay T-shirt!")
      product.comments.create!(rating: 5, user: user, body: "Awesome T-shirt!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq (3)
    end

    it "is not valid without name" do
      expect(Product.new(description: "Super cool shirt.")).not_to be_valid
    end
  end
end
