class PassedTestsController < ApplicationController
  before_action :set_current_test_passage, only: %i[show update result]

  def show
  end

  def result
  end

  def update
    @current_test_passage.accept!(params[:answer_ids])

    if @current_test_passage.completed?
      redirect_to result_passed_test_path(@current_test_passage)
    else
      render :show
    end
  end

  private

  def set_current_test_passage
    @current_test_passage = PassedTest.find(params[:id])
  end
end
