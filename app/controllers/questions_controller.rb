class QuestionsController < ApplicationController
  def index
    @test = Test.find(params[:test_id])
    @questions = @test.questions.all

    render inline: "Current test is: <%= @test.title %></br><ul><% @questions.each do |p| %><li><p><%= p.body %></p></li><% end %></p>"
  end

  def show
    @question = Question.find(params[:id])
    render inline: "Question text: <%= @question.body %>"
  end

end
