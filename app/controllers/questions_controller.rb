class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy

    redirect_to question.test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: "Question with params: #{ params.inspect } not found"
  end

end
