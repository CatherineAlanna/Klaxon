class Order < ApplicationRecord
# frozen_string_literal: true.
# Order
	belongs_to :product
  belongs_to :user
end
