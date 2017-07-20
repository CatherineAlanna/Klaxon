require 'rails_helper'

describe Comment do

  context "testing validations" do

    it "is not valid without a rating" do
      expect(Comment.new(rating:nil)).not_to be_valid
    end

    it "is not valid without text" do
      expect(Comment.new(body:nil)).not_to be_valid
    end

    it "is not valid without user id" do
      expect(Comment.new(user_id:nil)).not_to be_valid
    end
  end
end