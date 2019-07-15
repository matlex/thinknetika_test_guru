class FeedbacksMailer < ApplicationMailer

  def process_message(message_body, user)
    @message = message_body
    @user = user

    mail to: User.admins.last.email, subject: "TestGuru Feedback"
  end

end