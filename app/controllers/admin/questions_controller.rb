class Admin::QuestionsController < Admin::BaseController

  before_action :set_test, only: %i[create new]
  before_action :set_question, only: %i[show edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
  end

  def edit
  end

  def new
    @question = @test.questions.new
  end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question]
    else
      render :edit
    end
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to [:admin, @test]
    else
      render :new
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy

    redirect_to [:admin, question.test]
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question with params: #{ params.inspect } not found"
  end

end
