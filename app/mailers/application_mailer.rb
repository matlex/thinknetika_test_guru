class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru", <test_guru@example.com>}
  layout 'mailer'
end
