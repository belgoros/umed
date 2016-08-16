class ApplicationMailer < ActionMailer::Base
  default from: "UMed Belgium <info@umed.be>"
  include Roadie::Rails::Automatic
  layout 'mailer'
end
