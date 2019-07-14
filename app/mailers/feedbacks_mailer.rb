class FeedbacksMailer < ApplicationMailer

  def process_message(message_body, full_name)
    @message = message_body
    @user_name = full_name

    mail to: User.admins.last.email, subject: "TestGuru Feedback"
  end

end