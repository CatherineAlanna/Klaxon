<<<<<<< HEAD
class Order < ApplicationRecord
=======
# frozen_string_literal: true.
# Order
class Order < ActiveRecord::Base
>>>>>>> master
	belongs_to :product
  belongs_to :user
end
