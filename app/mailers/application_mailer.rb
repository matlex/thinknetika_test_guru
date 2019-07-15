class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru", <#{ENV['MAILER_OUTGOING_EMAIL']}>}
  layout 'mailer'
end
