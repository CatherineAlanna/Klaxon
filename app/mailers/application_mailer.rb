# frozen_string_literal: true.
# Application Mailer
class ApplicationMailer < ActionMailer::Base
  default from: 'hello@catherinealanna.com'
  layout 'mailer'
end
