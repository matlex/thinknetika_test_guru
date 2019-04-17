class TestsController < ApplicationController
  def show
    @test = Test.find(params[:id])
  end

  def index
    @tests = Test.all
  end
end
