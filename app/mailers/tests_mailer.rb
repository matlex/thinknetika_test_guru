class TestsMailer < ApplicationMailer

  def completed_test(current_test_passage)
    @user = current_test_passage.user
    @test = current_test_passage.test

    mail to: @user.email
  end

end
