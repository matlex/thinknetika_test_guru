class PassedTestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_current_test_passage, only: %i[show update result gist]

  def show
  end

  def result
  end

  def update
    if params[:answer_ids].nil?
      redirect_to @current_test_passage, flash: { error: t('.please_choose_answer') } and return
    end

    @current_test_passage.accept!(params[:answer_ids])

    if @current_test_passage.completed?
      TestsMailer.completed_test(@current_test_passage).deliver_now

      redirect_to result_passed_test_path(@current_test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@current_test_passage.current_question)
    result = service.call

    flash_options = if service.success?
                      current_user.gists.create(
                          question: @current_test_passage.current_question,
                          url: result.html_url,
                          user: current_user
                      )

                      { success: t('.success', url: result.html_url) }
                    else
                      { error: t('.failure') }
                    end

    redirect_to @current_test_passage, flash: flash_options
  end

  private

  def set_current_test_passage
    @current_test_passage = PassedTest.find(params[:id])
  end
end
