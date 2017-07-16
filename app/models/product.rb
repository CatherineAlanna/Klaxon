class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  def self.search(search_term)
  Product.where('name LIKE ?', "%#{search_term}%")
  end

  def average_rating
    comments.average(:rating).to_f
  end
end
