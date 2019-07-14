class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbacksMailer.process_message(@feedback.body, current_user.full_name).deliver_now
      redirect_to new_feedback_url, flash: { success: t('.success') }
    else
      flash[:error] = t('.error')
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body)
  end
end
