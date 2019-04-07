class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all

    render inline: "Current test is: <%= @test.title %></br><ul><% @questions.each do |p| %><li><p><%= p.body %></p></li><% end %></p>"
  end

  def show
    @question = Question.find(params[:id])
    render inline: "Question text: <%= @question.body %>"
  end

  def new

  end

  def create
    question = @test.questions.create(question_params)

    render plain: question.inspect
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy

    redirect_to tests_path
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question with params: #{ params.inspect } not found"
  end

end
