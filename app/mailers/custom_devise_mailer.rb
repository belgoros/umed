class CustomDeviseMailer < Devise::Mailer
  include Roadie::Rails::Automatic

  helper :application
  layout 'mailer'
end
