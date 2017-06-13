# frozen_string_literal: true.
# Order
class Order < ActiveRecord::Base
	belongs_to :product
  belongs_to :user
end
