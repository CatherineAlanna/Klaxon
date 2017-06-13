<<<<<<< HEAD
class User < ApplicationRecord
=======
# frozen_string_literal: true.
# User
class User < ActiveRecord::Base
  has_many :orders
>>>>>>> master
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
