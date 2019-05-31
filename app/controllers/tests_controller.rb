class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test, only: %i[show start]
  before_action :set_user, only: :start

  def show
  end

  def index
    @tests = Test.all
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end
