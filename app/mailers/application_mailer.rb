class ApplicationMailer < ActionMailer::Base
  default from: "info@umed.be"
  include Roadie::Rails::Automatic
  layout 'mailer'
end
