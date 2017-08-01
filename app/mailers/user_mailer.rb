# frozen_string_literal: true.
# User Mailer
class UserMailer < ApplicationMailer
	default from: 'hello@catherinealanna.com'

	def contact_form(email, name, message)
		@message = message
		mail(from: email, to: 'hello@catherinealanna.com', subject: "A new contact form message from #{name}")
	end

  def welcome(user)
    @appname = "Klaxon Shop"
    mail(to: user.email,
      subject: "Welcome to #{@appname}!")
  end

  def payment_confirmation(user, product)
    @user = user
    @product - product
    mail(to: user.email, subject: "Your order of the #{product.name} has been placed.").deliver_now
  end
end
